# Write your MySQL query statement below

-- with testing as (
-- select if(dense_rank() over (order by salary desc) = 2, salary, null) as SecondHighestSalary
-- from employee
-- )

-- select *
-- from testing


select max(salary) as SecondHighestSalary
from employee
where salary < (select max(salary) from employee)

