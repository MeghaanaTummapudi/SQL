# Write your MySQL query statement below

-- select coalesce(t.salary, null) as secondhighestsalary
-- from (select *, dense_rank() over (order by salary desc) as dr
-- from employee) as t
-- where t.dr = 2

with testing as (
select *, dense_rank() over (order by salary desc) as dr
from employee
)

select max(case when dr = 2 then salary else null end) as SecondHighestSalary
from testing
