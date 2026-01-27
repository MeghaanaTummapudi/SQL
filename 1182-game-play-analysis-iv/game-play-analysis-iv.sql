# Write your MySQL query statement below

-- round((count( a1.player_id) / (select count(player_id) from activity)), 2) as fraction
-- select count( a1.player_id), (select count( distinct player_id) from activity)
-- from activity as a1
-- join activity as a2 
-- on a1.player_id = a2.player_id 
-- where datediff(a2.event_date, a1.event_date) = 1 and a2.event_date > a1.event_date

with testing as (
select player_id, min(event_date) as first_login
from activity
group by player_id
) 


select round((count(distinct a1.player_id) / (select count(distinct player_id) from activity)), 2) as fraction
from activity as a1
join testing as t
on a1.player_id = t.player_id and datediff(a1.event_date, t.first_login) = 1

