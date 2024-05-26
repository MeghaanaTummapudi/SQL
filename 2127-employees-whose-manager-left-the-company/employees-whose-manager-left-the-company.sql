# Write your MySQL query statement below

with testing as (
select employee_id, manager_id, salary
from employees
where salary < 30000
)

select t.employee_id
from testing as t
where t.manager_id not in (select employee_id from employees)
order by t.employee_id asc

