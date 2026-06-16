# Write your MySQL query statement below

select t.city_id, t.day, t.degree
from (select *, 
       rank() over (partition by city_id order by degree desc, day asc) as rn
from weather) as t
where t.rn = 1
order by t.city_id asc
