# Write your MySQL query statement below

select t.emp_id, t.dept
from (select *, dense_rank() over (partition by dept order by salary desc) as rn
from employees) as t
where t.rn = 2
order by t.emp_id asc