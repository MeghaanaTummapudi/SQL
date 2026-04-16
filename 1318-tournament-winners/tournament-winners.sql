# Write your MySQL query statement below

with testing as (
select match_id, first_player as first, second_player as sec, first_score, second_score as sec_score
from matches

union all

select match_id, second_player as first, first_player as sec, second_score as first_score, first_score as sec_score 
from matches 
), 

testing2 as (
select first, sum(first_score) as tot
from testing
group by first
)

select t3.group_id, t3.first as player_id
from (select *, 
       row_number() over (partition by group_id order by tot desc, first asc) as r
from testing2 as t2
join players as p
on t2.first = p.player_id) as t3
where t3.r = 1

