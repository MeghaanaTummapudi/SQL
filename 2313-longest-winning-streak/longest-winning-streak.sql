# Write your MySQL query statement below

with testing as (
select *, 
       cast(row_number() over (partition by player_id order by match_day) as signed) as rn1
from matches
),

testing2 as (
select *, 
       cast(row_number() over (partition by player_id order by match_day) as signed) as rn2
from testing
where result = 'Win'
), 

testing3 as (
select t.player_id, max(t.n_c) as mtc
from (select player_id,  count(*) as n_c
from testing2
group by player_id, rn2 - rn1) as t
group by t.player_id
)

select distinct m.player_id, ifnull(t3.mtc, 0) as longest_streak
from matches as m
left join testing3 as t3
on m.player_id = t3.player_id


