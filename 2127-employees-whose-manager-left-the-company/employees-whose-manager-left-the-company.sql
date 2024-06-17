# Write your MySQL query statement below

with man_id as(
select distinct manager_id as man_id
from employees
where manager_id is not null),

emp_cr as (
select *
from employees
where salary < 30000 and manager_id is not null)

select e.employee_id
from emp_cr as e
left join man_id as m
on e.manager_id = m.man_id
where m.man_id not in (select employee_id from employees)
order by e.employee_id asc