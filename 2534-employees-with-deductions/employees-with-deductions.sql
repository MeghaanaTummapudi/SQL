# Write your MySQL query statement below

with testing as (
select *, round(timestampdiff(second, in_time, out_time) / 60) as n_c
from logs
), 

testing2 as (
select employee_id, sum(n_c) / 60 as tot
from testing
group by employee_id
)

select distinct e.employee_id
from employees as e
left join testing2 as t
on e.employee_id = t.employee_id
where e.needed_hours > ifnull(t.tot, 0)