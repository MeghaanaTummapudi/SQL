# Write your MySQL query statement below

with testing as (
select a.action_date, count(distinct a.post_id) as spam, count(distinct r.post_id) as rem
from actions as a
left join removals as r
on a.post_id = r.post_id
where a.extra = 'spam'
group by a.action_date
)

select round(ifnull(avg((rem / spam) * 100), 0), 2) as average_daily_percent
from testing