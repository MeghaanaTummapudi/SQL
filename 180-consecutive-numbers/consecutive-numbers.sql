# Write your MySQL query statement below

with testing as (
select *,
       lead(id, 1) over (order by id asc) as l2_id,
       lead(num, 1) over () as l2_num,
       lead(id, 2) over (order by id asc) as l3_id,
       lead(num, 2) over () as l3_num
from logs
)

select distinct(num) as ConsecutiveNums
from testing
where (l2_id - id) = 1 and (l3_id - l2_id) = 1 and (num = l2_num) and (l2_num = l3_num)
-- select num as ConsecutiveNums
-- from testing
-- where (l2_id - id) = 1 and (l3_id - l2_id) = 1 and (num = l2_num = l3_num)
