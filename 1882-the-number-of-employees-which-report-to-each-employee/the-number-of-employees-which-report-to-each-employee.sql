# Write your MySQL query statement below

with testing as (
select distinct reports_to, count(*) as reports_count, round(avg(age)) as average_age
from Employees 
where reports_to is not null
group by reports_to
)

select e.employee_id, e.name, t.reports_count, t.average_age
from testing as t
left join Employees as e
on t.reports_to = e.employee_id
order by e.employee_id

