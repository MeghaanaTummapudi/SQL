# Write your MySQL query statement below

-- select t.company_id, t.employee_id, t.employee_name, 
--                 (case when t.mas < 1000 then t.salary
--                  when t.mas between 1000 and 10000 then round(t.salary - (0.24 * t.salary))
--                  when t.mas > 10000 then round(t.salary - (0.49 * t.salary))
--             else null end) as salary
-- from (select *, 
--        max(salary) over (partition by company_id order by salary desc) as mas
-- from salaries) as t

with testing as (
select company_id, max(salary) as mas
from salaries
group by company_id
)

select s.company_id, s.employee_id, s.employee_name, (case when t.mas < 1000 then s.salary
                 when t.mas between 1000 and 10000 then round(s.salary - (0.24 * s.salary))
                 when t.mas > 10000 then round(s.salary - (0.49 * s.salary))
            else null end) as salary
from salaries as s
join testing as t
on s.company_id = t.company_id