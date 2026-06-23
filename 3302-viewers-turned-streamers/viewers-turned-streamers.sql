# Write your MySQL query statement below

with testing as (
select user_id, min(session_start) as start
from sessions
group by user_id
), 

testing2 as (
select user_id, session_id, session_start
from sessions
where session_type = 'Viewer' and (user_id, session_start) in (select user_id, start from testing)
)

select s.user_id, count(s.session_id) as sessions_count
from sessions as s
join testing2 as t2
on s.user_id = t2.user_id and s.session_id <> t2.session_id
where s.session_type = 'Streamer'
group by s.user_id
order by sessions_count desc, s.user_id desc

-- select *
-- from sessions
-- where user_id = 101
-- order by session_start

-- select *
-- from testing2
