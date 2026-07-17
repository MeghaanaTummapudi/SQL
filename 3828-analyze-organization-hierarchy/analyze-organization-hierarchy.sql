# Write your MySQL query statement below

with recursive cte as (

select employee_id, employee_name, 1 as level
from employees 
where manager_id is null

union all

select e.employee_id, e.employee_name, c.level + 1
from cte as c
join employees as e
on c.employee_id = e.manager_id
),

testing as (

select employee_id as root, employee_id, employee_name, salary, 0 as size
from employees 

union all

select t.root, e.employee_id, e.employee_name, e.salary, t.size + 1
from testing as t
join employees as e
on t.employee_id = e.manager_id
), 

testing2 as (
select root, count(*) - 1 as size, sum(salary) as budget
from testing
group by root
)

select c.employee_id, c.employee_name, c.level, t2.size as team_size, t2.budget
from cte as c
join testing2 as t2
on c.employee_id = t2.root
order by c.level asc, t2.budget desc, c.employee_name asc