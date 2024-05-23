# Write your MySQL query statement below

with testing as (
select num, count(*) as n_count
from mynumbers
group by num
having n_count = 1
)

select 
(case when num is not null then max(num) else null end ) as num
-- (case when num in max(num) then num else null end) as num
from testing