# Write your MySQL query statement below

-- select *, 
--        (case when wimbledon then wimbledon
--              when fr_open then fr_open
--              when us_open then us_open
--              when au_open then au_open
--              else null end) as player_wins
-- from championships 

with testing as (
select wimbledon as player_id
from championships

union all

select Fr_open as player_id
from championships

union all

select US_open as player_id
from championships

union all

select Au_open as player_id
from championships
)

select t.player_id, p.player_name, count(*) as grand_slams_count
from testing as t
join players as p
on p.player_id = t.player_id
group by player_id
