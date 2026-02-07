# Write your MySQL query statement below

select employee_id, (case when employee_id % 2 = 0 then 0
               when (employee_id % 2 != 0 and left(name, 1) != 'M') then salary else 0 end) as Bonus
from employees 
order by employee_id