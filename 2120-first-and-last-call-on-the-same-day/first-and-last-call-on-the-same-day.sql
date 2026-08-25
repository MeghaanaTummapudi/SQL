# Write your MySQL query statement below

with testing as (
select caller_id as u1, recipient_id as p2, call_time
from calls

union all

select recipient_id as u1, caller_id as p2, call_time
from calls
), 

testing2 as (
select u1, date_format(call_time, '%Y-%m-%d') as dt, min(call_time) as tf, max(call_time) as tl
from testing
group by u1, date_format(call_time, '%Y-%m-%d')
), 

fcall as (
select t.u1, t2.tf, t.p2
from testing as t
left join testing2 as t2
on t.u1 = t2.u1 and t.call_time = t2.tf
where t2.tf is not null
), 

lcall as (
select t.u1, t2.tl, t.p2
from testing as t
left join testing2 as t2
on t.u1 = t2.u1 and t.call_time = t2.tl
where t2.tl is not null
)

select distinct c1.u1 as user_id
from fcall as c1
join lcall as c2
on c1.u1 = c2.u1 and date_format(c1.tf, '%Y-%m-%d') = date_format(c2.tl, '%Y-%m-%d')
where c1.p2 = c2.p2
order by user_id asc