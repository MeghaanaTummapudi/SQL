# Write your MySQL query statement below

with testing as (
select *
from employee
where primary_flag = 'Y'
),

test2 as (
select *
from employee
where primary_flag = 'N' and employee_id not in (select employee_id from testing)
group by employee_id
having count(employee_id) = 1
)

select employee_id, department_id
from testing 

union all

select employee_id, department_id
from test2




