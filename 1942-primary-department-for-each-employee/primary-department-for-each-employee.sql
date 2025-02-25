# Write your MySQL query statement below

select employee_id, department_id
from Employee
where primary_flag = 'Y'

union all

select sub.employee_id, sub.department_id
from (select * from employee group by employee_id
having count(employee_id) = 1 ) as sub
where sub.primary_flag = 'N'
