# Write your MySQL query statement below

with testing as (
select player_id, min(event_date) as min_date
from activity
group by player_id
)

select round(count(distinct a.player_id) / (select count(distinct player_id) from activity), 2) as fraction
from activity as a
left join testing as t
on a.player_id = t.player_id
where datediff(a.event_date, t.min_date) = 1












































































-- round(count(a1.player_id) / (select count(distinct player_id) from activity), 2) as fraction
-- a1.player_id, a1.event_date, a2.event_date, count( distinct a1.player_id), (select count(distinct player_id) from activity) as tot
-- select *
-- from activity as a1
-- inner join activity as a2
-- on a1.player_id = a2.player_id and  a1.event_date < a2.event_date and datediff(a2.event_date, a1.event_date) = 1 

# 100
-- select a1.player_id, a1.event_date, a2.event_date
-- from activity as a1
-- inner join activity as a2
-- on a1.player_id = a2.player_id and  a1.event_date < a2.event_date and datediff(a2.event_date, a1.event_date) = 1
