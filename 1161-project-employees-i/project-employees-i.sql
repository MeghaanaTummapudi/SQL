# Write your MySQL query statement below

select p.project_id, round(sum(e.experience_years)/count(*), 2) as average_years
from employee as e
left join project as p
on e.employee_id = p.employee_id
where p.project_id is not null
group by p.project_id