# Write your MySQL query statement below

with testing as (
select host_team, guest_team, 
       (case when host_goals > guest_goals then 3
            when host_goals = guest_goals then 1
            when host_goals < guest_goals then 0
            else null end) as host_points, 
       (case when guest_goals > host_goals then 3
            when host_goals = guest_goals then 1
            when guest_goals < host_goals then 0
            else null end) as guest_points
from matches
),

testing2 as (
select host_team, sum(host_points) as tsts
from testing
group by host_team

union all 

select guest_team, sum(guest_points) as tsts
from testing 
group by guest_team
)

select t.team_id, t.team_name, coalesce(sum(t2.tsts), 0) as num_points
from teams as t
left join testing2 as t2
on t.team_id = t2.host_team
group by t.team_id
order by num_points desc, t.team_id asc
-- t.team_id, t.team_name, coalesce(sum(t2.tsts), 0) as num_points