# Write your MySQL query statement below

with testing as (
select *, 
       sum(frequency) over (order by num) as test,
       sum(frequency) over () as tot
from numbers 
), 

testing2 as (
select *, test - frequency as prev,
       (case when tot % 2 <> 0 then round((tot/2))
            when tot % 2 = 0 then (tot / 2)
       else null end) as pos1, 
       (case when tot % 2 = 0 then (tot/2) + 1 else null end) as pos2
from testing
)

select avg(num) as median
from testing2
where (pos1 > prev and pos1 <= test) or (pos2 > prev and pos2 <= test)

