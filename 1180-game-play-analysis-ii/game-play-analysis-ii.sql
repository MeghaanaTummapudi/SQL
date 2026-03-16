# Write your MySQL query statement below

select player_id, device_id
from activity
where (player_id, event_date) in (select player_id, min(event_date)
from activity
group by player_id)

-- select t.player_id, t.device_id
-- from (select *, 
--        rank() over (partition by player_id order by event_date asc) as r
-- from activity) as t
-- where t.r = 1

