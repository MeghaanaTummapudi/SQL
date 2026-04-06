# Write your MySQL query statement below

-- with testing as (
-- select project_id, count(distinct employee_id) as n
-- from project
-- group by project_id
-- )

-- select project_id
-- from testing
-- where n in (select max(n) from testing)

select project_id
from project
group by project_id
having count(*) = (select max(t.n)
from (select project_id, count(distinct employee_id) as n
from project
group by project_id) as t) 
