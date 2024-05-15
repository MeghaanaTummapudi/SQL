# Write your MySQL query statement below
with testing as (
    select e.id as emp_id, e.name as emp_name, e.salary, d.id as dept_id, d.name as dept_name,
           dense_rank() over (partition by d.name order by e.salary desc) as d_rank
    from employee as e
    left join department as d
    on e.departmentId = d.id
)

-- select *
-- from testing
select dept_name as Department, emp_name as Employee, salary
from testing
where d_rank in (1, 2, 3)
order by salary desc