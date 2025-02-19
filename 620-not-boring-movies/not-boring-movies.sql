# Write your MySQL query statement below

-- select *
-- from Cinema
-- where lower(description) <> 'boring' and  id % 2 <> 0 
-- order by rating desc

select *
from Cinema
where lower(description) <> 'boring' and (id like '%1' or id like'%3' or id like '%5' or id like '%7' or id like '%9')
order by rating desc