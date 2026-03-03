# Write your MySQL query statement below

-- select t.project_id, t.employee_id
-- from (select p.project_id, e.employee_id,
--        dense_rank() over (partition by p.project_id order by e.experience_years desc) as dr 
-- from project as p
-- left join employee as e
-- on p.employee_id = e.employee_id) as t
-- where t.dr = 1

with testing as (
select p.project_id, max(e.experience_years) as expt
from project as p
left join employee as e
on p.employee_id = e.employee_id
group by p.project_id
)

select distinct p.project_id, e.employee_id
from project as p 
left join employee as e
on p.employee_id = e.employee_id
join testing as t
on t.expt = e.experience_years and p.project_id = t.project_id








