# Write your MySQL query statement below

-- select num, count(*) as n
-- from logs
-- group by num
-- having n >= 3

with testing as (
select id, num, lag(num, 1) over () as t1, lag(num, 2) over () as t2
from logs
)

select distinct num as ConsecutiveNums 
from testing
where num = t1 and t1 = t2 and num = t2