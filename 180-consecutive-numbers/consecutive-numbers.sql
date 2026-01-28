# Write your MySQL query statement below

-- select distinct l1.num as consecutivenums
-- from logs as l1
-- join logs as l2
-- on l2.id > l1.id and (l2.id - l1.id) = 1
-- join logs as l3
-- on l3.id > l2.id and (l3.id - l2.id) = 1
-- where l1.num = l2.num and l2.num = l3.num

select distinct t.num as consecutivenums
from (select *, lead(num, 1) over (order by id asc) as num2, lead(num, 2) over      (order by id asc) as num3
      from logs) as t
where t.num = t.num2 and t.num2 = t.num3
