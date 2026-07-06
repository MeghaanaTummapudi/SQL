# Write your MySQL query statement below

with testing as (
select *, 
       row_number() over () as rn
from coordinates
)

select distinct t1.x, t1.y
from testing as t1
left join testing as t2 
on t1.rn <> t2.rn
where t1.x = t2.y and t2.x = t1.y and t1.x <= t1.y
order by t1.x asc, t1.y asc