# Write your MySQL query statement below

with testing as (
select l1.id as l1_id, l1.num as l1_num, l2.id as l2_id, l2.num as l2_num, l3.id as l3_id, l3.num as l3_num
from Logs as l1
join Logs as l2
on l2.id - l1.id = 1 and l2.id > l1.id
join Logs as l3
on l3.id - l2.id = 1 and l3.id > l2.id
)

select distinct l1_num as ConsecutiveNums
from testing
where l1_num = l2_num and l2_num = l3_num 