# Write your MySQL query statement below

with recursive cte as (
select employee_id, employee_name, manager_id, salary, 0 as level
from employees
where manager_id is null

union all

select e.employee_id, e.employee_name, e.manager_id, e.salary, c.level + 1
from cte as c
join employees as e
on c.employee_id = e.manager_id
)

select t.employee_id as subordinate_id, t.employee_name as subordinate_name, t.level as hierarchy_level, (t.salary - t.tsts) as salary_difference
from (select *, 
       sum((case when manager_id is null then salary end)) over () as tsts
from cte) as t
where t.manager_id is not null
order by hierarchy_level asc, subordinate_id asc

