# Write your MySQL query statement below

-- with testing as (
-- select *, 
--        row_number() over (order by x asc) as r
-- from point
-- )

-- select min(abs(t1.x - t2.x)) as shortest
-- from testing as t1
-- join testing as t2 
-- on t1.r < t2.r and t2.r - t1.r = 1

select min(abs(t.x - t.d)) as shortest
from (select *,
       lead(x) over (order by x asc) as d
from point) as t
