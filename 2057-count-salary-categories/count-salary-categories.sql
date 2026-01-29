# Write your MySQL query statement below

-- select *, 
--        (case when income < 20000 then 'Low Salary' 
--             when income between 20000 and 50000 then 'Average Salary'
--             when income > 50000 then 'High Salary'
--         else null end) as type
-- from accounts 

-- select ('low salary', 'average salary', 'high salary') as type

with testing as (
select 'Low Salary' as type
union
select 'Average Salary' as type
union
select 'High Salary' as type
), 

testing2 as 
(select *, 
       (case when income < 20000 then 'Low Salary' 
            when income between 20000 and 50000 then 'Average Salary'
            when income > 50000 then 'High Salary'
        else null end) as type
from accounts)

select t.type as category, coalesce(count(t2.type), 0) as accounts_count
from testing as t
left join testing2 as t2
on t.type = t2.type
group by t.type
order by accounts_count desc