# Write your MySQL query statement below

-- with testing as (
--     select (case when sub.d_rank = 2 then sub.salary else null end) as SecondHighestSalary
--     from (select id, salary,
--              dense_rank() over (order by salary desc) as d_rank
--           from Employee) as sub
-- )
-- select *
-- from testing
-- where (case when SecondHighestSalary is not null then SecondHighestSalary else null end)

select (case when count(salary) >= 1 then max(salary) else null end) as SecondHighestSalary
from employee
where salary < (select max(salary) from employee)
