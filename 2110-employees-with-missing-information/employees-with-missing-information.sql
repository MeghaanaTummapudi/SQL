# Write your MySQL query statement below

-- with testing as (
-- select e.employee_id as eid, e.name, s.employee_id, s.salary
-- from employees as e
-- left join salaries as s
-- on e.employee_id = s.employee_id
-- ), 

-- testing2 as (
-- select e.employee_id as eid, e.name, s.employee_id, s.salary
-- from employees as e
-- right join salaries as s
-- on e.employee_id = s.employee_id
-- ), 

-- cte_fin as (
-- select eid as employee_id
-- from testing
-- where name is null or salary is null

-- union 

-- select employee_id
-- from testing2
-- where salary is null or name is null
-- )

-- select *
-- from cte_fin
-- order by employee_id

with testing as (
select e.employee_id as eid
from employees as e
left join salaries as s
on e.employee_id = s.employee_id
where e.name is null or s.salary is null

union

select  s.employee_id
from employees as e
right join salaries as s
on e.employee_id = s.employee_id
where e.name is null or s.salary is null
)

select eid as employee_id
from testing
order by eid
