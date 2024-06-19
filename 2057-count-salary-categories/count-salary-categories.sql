# Write your MySQL query statement below

select  'Low Salary' as category, count(*) as accounts_count
from accounts
where income < 20000

union all

select  'Average Salary' as category, count(*) as accounts_count
from accounts
where income between 20000 and 50000

union all

select  'High Salary' as category, count(*) as accounts_count
from accounts
where income > 50000






-- with testing as (
-- select *,
--        (case when income < 20000 then 'Low Salary'
--              when income between 20000 and 50000 then 'Average Salary'
--              when income > 50000 then 'High Salary' else null end) as category
-- from accounts
-- )

-- select category,
--        coalesce(sum(case when category = 'High Salary' then 1
--              when category = 'Average Salary'  then 1
--              when category = 'Low Salary'  then 1 else 0 end), 0) as nc 
-- from testing
-- group by category