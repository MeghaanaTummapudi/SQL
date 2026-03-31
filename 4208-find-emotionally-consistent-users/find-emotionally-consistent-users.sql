# Write your MySQL query statement below

with testing as (
select user_id, count(reaction) as totn_c
from reactions
group by user_id
having totn_c >= 5
), 

testing2 as (
select user_id, reaction, count(*) as sub
from reactions
group by user_id, reaction
), 

testing3 as (
select user_id, max(sub) as msub
from testing2
group by user_id
), 

testing4 as (
(select t1.user_id, t3.msub, round((t3.msub/t1.totn_c), 2) as ratio
from testing3 as t3
join testing as t1
on t3.user_id = t1.user_id
where round((t3.msub/t1.totn_c), 2) >= 0.60)
)

select t4.user_id, t2.reaction as dominant_reaction, t4.ratio as reaction_ratio
from testing4 as t4
left join testing2 as t2
on t2.user_id = t4.user_id and t4.msub = t2.sub
order by reaction_ratio desc, user_id asc