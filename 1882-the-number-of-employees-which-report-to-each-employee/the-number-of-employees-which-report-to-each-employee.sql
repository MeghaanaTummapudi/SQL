# Write your MySQL query statement below

with testing as (
select distinct reports_to as manager_id, count(*) as n_c, round(avg(age)) as avg_age
from employees
where reports_to is not null
group by reports_to
)

select t.manager_id as employee_id, e.name, t.n_c as reports_count, t.avg_age as average_age
from testing as t
join employees as e
on t.manager_id = e.employee_id
order by t.manager_id asc

