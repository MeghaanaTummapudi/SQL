# Write your MySQL query statement below

with testing as (
select reports_to, count(*) as n_c, round(avg(age)) as avg_age
from employees
where reports_to is not null
group by reports_to
)

select e.employee_id, e.name, t.n_c as reports_count, t.avg_age as average_age
from testing as t
left join employees as e
on t.reports_to = e.employee_id
order by e.employee_id asc