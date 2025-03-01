# Write your MySQL query statement below

-- select distinct a1.player_id
-- from Activity as a1
-- left join Activity as a2
-- on a1.player_id = a2.player_id and a2.event_date > a1.event_date
-- where datediff(a2.event_date, a1.event_date) = 1
-- order by a1.player_id
with testing as (
select player_id, min(event_date) as first_login
from Activity
group by player_id
)

select round(count(distinct t.player_id) / (select count(distinct player_id) from Activity), 2) as fraction
from Activity as a1
left join testing as t
on a1.player_id = t.player_id and datediff(a1.event_date, t.first_login) = 1