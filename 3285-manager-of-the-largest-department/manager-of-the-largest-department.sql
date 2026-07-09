# Write your MySQL query statement below

with testing as (
select dep_id, count(*) as n_c
from employees
group by dep_id
)


select emp_name as manager_name, dep_id
from employees
where dep_id in (select dep_id
from testing
where n_c in (select max(n_c) from testing)) and position = 'Manager'
order by dep_id asc
