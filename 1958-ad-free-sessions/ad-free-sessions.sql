# Write your MySQL query statement below

with testing as (
select distinct p.session_id
from playback as p
left join ads as a
on p.customer_id = a.customer_id
where a.timestamp between p.start_time and p.end_time
)

select distinct session_id
from playback
where session_id not in (select session_id from testing)