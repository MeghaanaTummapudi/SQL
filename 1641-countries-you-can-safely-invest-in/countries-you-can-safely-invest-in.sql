# Write your MySQL query statement below

-- select ((2 * sum(duration)) / (2 * count(duration))) as global_durt
-- from calls

with testing as (
select p.id as pid, c.name as country
from country as c
left join person as p
on c.country_code = left(p.phone_number, 3)
), 

-- select *
-- from calls as ca
-- join testing as t
-- on ca.caller_id = t.pid

testing2 as (
select (case when caller_id then (select country from testing where caller_id = pid) else null end) as caller_country, 
       (case when callee_id then (select country from testing where callee_id = pid) else null end) as callee_country, duration
from calls 
), 

testing3 as (
select caller_country as country, sum(duration) as durat, count(caller_country) as call_count
from testing2
group by caller_country

union all

select callee_country as country, sum(duration) as durat, count(callee_country) as call_count
from testing2
group by callee_country
)

select t.country
from (select country, sum(durat) / sum(call_count) as avg
      from testing3
      group by country) as t
where t.avg > (select ((2 * sum(duration)) / (2 * count(duration))) as global_durt from calls)
