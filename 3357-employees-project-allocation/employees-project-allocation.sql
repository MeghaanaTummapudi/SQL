# Write your MySQL query statement below

select t.employee_id, t.project_id, t.name as EMPLOYEE_NAME, t.workload as PROJECT_WORKLOAD
from (select p.employee_id, p.project_id, e.name, p.workload, avg(p.workload) over (partition by e.team) as avg_w
from project as p
left join employees as e
on p.employee_id = e.employee_id) as t
where t.workload > t.avg_w
order by t.employee_id, t.project_id asc
