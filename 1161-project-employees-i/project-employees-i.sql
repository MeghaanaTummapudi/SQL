# Write your MySQL query statement below

select p.project_id, round(sum(experience_years) / count(*), 2) as average_years
from project as p
left join employee as e
on p.employee_id = e.employee_id
group by p.project_id