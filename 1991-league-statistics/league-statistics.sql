# Write your MySQL query statement below

with testing as (
select *, 
       (case when home_team_goals > away_team_goals then 3 
            when home_team_goals = away_team_goals then 1
       else 0 end) as home, 
       (case when home_team_goals < away_team_goals then 3 
            when home_team_goals = away_team_goals then 1
       else 0 end) as away
from matches
), 

testing2 as (
select home_team_id as id, home as points
from testing

union all

select away_team_id as id, away as points
from testing
), 

testing3 as (
select id, count(*) as matches_played, sum(points) as points
from testing2
group by id
),
 
testing4 as (
select home_team_id as id, home_team_goals as goals
from matches

union all

select away_team_id as id, away_team_goals as goals
from matches
), 

testing5 as (
select id, sum(goals) as goals_for
from testing4
group by id
),

testing6 as (
select home_team_id as id, away_team_goals as goals
from matches

union all

select away_team_id as id, home_team_goals as goals
from matches
),

testing7 as (
select id, sum(goals) as goals_against
from testing6
group by id
)

select t.team_name, t3.matches_played, t3.points, t5.goals_for as goal_for, t7.goals_against as goal_against, (t5.goals_for - t7.goals_against) as goal_diff
from teams as t
join testing3 as t3
on t.team_id = t3.id
left join testing5 as t5
on t3.id = t5.id
left join testing7 as t7
on t3.id = t7.id
order by points desc, goal_diff desc, team_name asc