# Write your MySQL query statement below

with testing as (
select s1.user_id, timestampdiff(hour, s1.session_start, s2.session_start) as t1, 
       timestampdiff(hour, s1.session_end, s2.session_start) as t2
from sessions as s1
join sessions as s2
on s1.user_id = s2.user_id and s1.session_type = s2.session_type
where s1.session_start < s2.session_start
order by s1.user_id
)

select distinct user_id
from testing
where t1 <= 12 or t2 <= 12
order by user_id