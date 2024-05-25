# Write your MySQL query statement below

-- with testing as(
-- select account_id,
--        (case when (income < 20000) then 'Low Salary'
--              when (income between 20000 and 50000) then 'Average Salary'
--              when (income > 50000) then 'High Salary'
--         end) as category
-- from accounts
-- )

-- select category, coalesce(count(*), 0) as accounts_count
-- from testing
-- group by category


select 'Low Salary' as category, count(*) as  accounts_count
from accounts
where income < 20000

union 

select 'Average Salary' as category, count(*) as  accounts_count
from accounts
where (income between 20000 and 50000)

union

select 'High Salary' as category, count(*) as  accounts_count
from accounts
where income > 50000





































































