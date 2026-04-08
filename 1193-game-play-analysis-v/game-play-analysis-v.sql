# Write your MySQL query statement below

with testing as (
select player_id, min(event_date) as install_date
from activity
group by player_id 
),

-- testing2 as (
-- select a.player_id, a.event_date, count(*) as tot
-- from activity as a
-- join testing as t
-- on a.player_id = t.player_id 
-- where a.event_date = t.install
-- group by a.event_date
-- )

-- select *, 
--        dense_rank() over (partition by player_id order by event_date) as dr
-- from activity

nextday as (
select t.install_date, count(*) as n_c
from activity as a
join testing as t
on a.player_id = t.player_id
where datediff(a.event_date, t.install_date) = 1
group by t.install_date
), 

testing3 as (
select t.install_date, count(*) as n
from activity as a
join testing as t
on a.player_id = t.player_id
where a.event_date = t.install_date
group by t.install_date
)

select t3.install_date as install_dt, n as installs, round((ifnull(n_c, 0) / n), 2) as Day1_retention 
from testing3 as t3
left join nextday as nd
on t3.install_date = nd.install_date
order by t3.install_date asc