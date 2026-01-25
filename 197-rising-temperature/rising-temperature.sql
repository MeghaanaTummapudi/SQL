# Write your MySQL query statement below

with testing as (
select *
from weather 
order by recorddate 
)

select t2.id
from testing as t1
join testing as t2 
on datediff(t2.recorddate, t1.recorddate) = 1 and t2.recorddate > t1.recorddate
where t2.temperature > t1.temperature
