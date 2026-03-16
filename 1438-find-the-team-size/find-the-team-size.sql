# Write your MySQL query statement below

with testing as (
select team_id, count(*) as n_c
from employee
group by team_id
)

select e.employee_id, t.n_c as team_size
from employee as e
join testing as t
on e.team_id = t.team_id