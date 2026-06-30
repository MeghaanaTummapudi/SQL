# Write your MySQL query statement below

select t.emp_id, t.firstname, t.lastname, t.salary, t.department_id
from (select *, 
       row_number() over (partition by emp_id order by salary desc) as rn
from salary) as t
where t.rn = 1
order by t.emp_id asc