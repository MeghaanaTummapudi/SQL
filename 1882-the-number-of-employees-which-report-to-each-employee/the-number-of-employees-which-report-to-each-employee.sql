# Write your MySQL query statement below

with testing as (
select reports_to as man_id, count(*) as nc, round(avg(age)) as navg
from employees
where reports_to is not null 
group by reports_to
having nc >= 1
)

select e.employee_id as employee_id, e.name as name, t.nc as reports_count, t.navg as average_age
from testing as t
left join employees as e
on t.man_id = e.employee_id
order by employee_id
