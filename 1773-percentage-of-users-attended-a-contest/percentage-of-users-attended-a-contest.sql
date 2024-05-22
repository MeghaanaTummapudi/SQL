# Write your MySQL query statement below

-- r.contest_id, sum(case when u.user_id = r.user_id then 1 else 0 end) as t
with testing as (
select r.contest_id, count(distinct u.user_id) as t
from users as u
left join register as r
on u.user_id = r.user_id
group by r.contest_id
),

total as (
select count(distinct user_id) as tot
from users
)

-- contest_id, round((t/(select tot from total) * 100), 2) as percentage
select contest_id, round((t/(select tot from total) * 100), 2) as percentage
from testing
where contest_id is not null
order by percentage desc, contest_id asc