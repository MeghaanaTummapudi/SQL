# Write your MySQL query statement below

-- with testing as (
-- select t.user_id, t.session_id, timestampdiff(minute, t.mi, t.ma) as mint
-- from (select user_id, session_id, min(event_timestamp) as mi, max(event_timestamp) as ma
-- from app_events
-- group by user_id, session_id) as t
-- ), 

-- testing2 as (
    
--     select user_id, session_id, count(*) as n_c
--     from app_events
--     where event_type = 'scroll'
--     group by user_id, session_id, event_type
--     having count(*) >= 5

-- ), 

-- testing3 as (
-- select user_id, session_id, sum(event_type = 'click') / sum(event_type = 'scroll') as ratio, sum(event_type = 'purchase') as n_c
-- from app_events
-- group by user_id, session_id
-- having ratio < 0.2 and n_c = 0
-- )

-- select distinct t1.session_id, t1.user_id, t1.mint as session_duration_minutes, t2.n_c as scroll_count
-- from testing as t1
-- join testing2 as t2
-- on t1.user_id = t2.user_id and t1.session_id = t2.session_id
-- join testing3 as t3
-- on t1.user_id = t3.user_id and t1.session_id = t3.session_id
-- where t1.mint > 30
-- order by t2.n_c desc, t1.session_id asc

with testing as (
select t.user_id, t.session_id, timestampdiff(minute, t.mi, t.ma) as mint
from (select user_id, session_id, min(event_timestamp) as mi, max(event_timestamp) as ma
from app_events
group by user_id, session_id) as t
where timestampdiff(minute, t.mi, t.ma) > 30
), 

testing2 as (
select user_id, session_id, sum(event_type = 'scroll') as sn_c, sum(event_type = 'click') / sum(event_type = 'scroll') as ratio, sum(event_type = 'purchase') as n_c
from app_events
group by user_id, session_id
having sn_c >= 5 and ratio < 0.2 and n_c = 0
) 


select distinct t1.session_id, t1.user_id, t1.mint as session_duration_minutes, t2.sn_c as scroll_count
from testing as t1
join testing2 as t2
on t1.user_id = t2.user_id and t1.session_id = t2.session_id
order by t2.sn_c desc, t1.session_id asc





