# Write your MySQL query statement below

with testing as (
select project_id, count(distinct employee_id) as n
from project
group by project_id
)

select project_id
from testing
where n in (select max(n) from testing)