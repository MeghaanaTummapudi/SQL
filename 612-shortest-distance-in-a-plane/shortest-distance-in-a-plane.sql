# Write your MySQL query statement below

with testing as (
select *, 
       row_number() over(order by x, y) as r
from point2d
)

select min(round(sqrt(power((t2.x - t1.x), 2) + power((t2.y - t1.y), 2)), 2)) as shortest
from testing as t1
join testing as t2
on t1.r <> t2.r
