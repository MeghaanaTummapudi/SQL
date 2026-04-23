# Write your MySQL query statement below

select t.company_id, t.employee_id, t.employee_name, 
                (case when t.mas < 1000 then t.salary
                 when t.mas between 1000 and 10000 then round(t.salary - (0.24 * t.salary))
                 when t.mas > 10000 then round(t.salary - (0.49 * t.salary))
            else null end) as salary
from (select *, 
       max(salary) over (partition by company_id order by salary desc) as mas
from salaries) as t

