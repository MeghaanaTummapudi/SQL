# Write your MySQL query statement below

with testing as (
select p.pass_from, t.team_name as pass_team, p.time_stamp
from passes as p
join teams as t
on p.pass_from = t.player_id 
), 

testing2 as (
select p.pass_to as passed_to, t.team_name as passed_to_team, p.time_stamp
from passes as p
join teams as t
on p.pass_to = t.player_id 
), 

fin_test as (
select t1.pass_from, t1.pass_team, t2.passed_to, t2.passed_to_team, t1.time_stamp,
       (case when t1.time_stamp between '00:00' and '45:00' then 1 else 2 end) as hal
from testing as t1
join testing2 as t2
on t1.time_stamp = t2.time_stamp
order by t1.pass_from, t1.time_stamp
)

select pass_team as team_name, hal as half_number, sum(case when pass_team = passed_to_team then +1 else -1 end) as dominance
from fin_test
group by pass_team, hal
order by pass_team asc, hal asc