# Write your MySQL query statement below

-- with testing as (
-- select t.department, t.salary
-- from (select *, 
--        row_number() over (partition by department order by salary desc) as rn
-- from salaries) as t
-- where t.rn = 1
-- )

-- select abs(max(case when department = 'Engineering' then salary else 0 end) -  max(case when department = 'Marketing' then salary else 0 end)) as salary_difference
-- from testing

with testing as (
select department, max(salary) as salary
from salaries
where department = 'Engineering'

union all

select department, max(salary) as salary
from salaries
where department = 'Marketing'
)


select abs(max(case when department = 'Engineering' then salary else 0 end) -  max(case when department = 'Marketing' then salary else 0 end)) as salary_difference
from testing