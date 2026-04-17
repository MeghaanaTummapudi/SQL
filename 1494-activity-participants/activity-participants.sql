# Write your MySQL query statement below

-- with testing as (
-- select max(t.cnt) as max_ct, min(t.cnt) as min_ct
-- from (select activity, count(*) as cnt
-- from friends
-- group by activity) as t
-- )

-- select distinct activity
-- from friends
-- group by activity
-- having count(activity) not in (select min_ct from testing) and count(activity) not in (select max_ct from testing)

with testing as (
select *, 
       dense_rank() over (order by count(*) desc) as dr
from friends
group by activity
)

select distinct activity
from testing
where dr not in (select max(dr) from testing) and dr not in (select min(dr) from testing)