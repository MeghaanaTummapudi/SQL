# Write your MySQL query statement below

select distinct city
from (select city, avg(price) over () as nat_avg, avg(price) over (partition by city) as city_avg
from listings) as t
where t.city_avg > t.nat_avg
order by city asc


