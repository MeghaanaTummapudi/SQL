# Write your MySQL query statement below

with testing as (
select distinct employee_id, manager_id
from Employees
where manager_id is not null and salary < 30000
)

select t.employee_id
from testing as t
left join employees as e
on t.manager_id = e.employee_id 
where e.employee_id is null 
order by t.employee_id