# Write your MySQL query statement below

with testing as (
select team_id, sum(points_change) as tot
from pointschange
group by team_id
),

testing2 as (
select tp.team_id, tp.name,  
       dense_rank() over (order by tp.points desc, tp.name asc) as dr1, 
       dense_rank() over (order by (tp.points + t.tot) desc, tp.name asc) as dr2
from teampoints as tp
join testing as t
on tp.team_id = t.team_id
)

select team_id, name, (convert(dr1, signed) - convert(dr2, signed)) as rank_diff
from testing2