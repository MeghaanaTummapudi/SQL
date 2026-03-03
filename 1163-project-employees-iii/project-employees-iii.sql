# Write your MySQL query statement below

select t.project_id, t.employee_id
from (select p.project_id, e.employee_id,
       dense_rank() over (partition by p.project_id order by e.experience_years desc) as dr 
from project as p
left join employee as e
on p.employee_id = e.employee_id) as t
where t.dr = 1










