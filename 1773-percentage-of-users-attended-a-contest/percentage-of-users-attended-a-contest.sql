# Write your MySQL query statement below

-- select r.contest_id, coalesce(round(count(r.user_id) / (select count( distinct user_id) from Users) * 100, 2), 0) as percentage
-- from Users as u
-- left join Register as r
-- on u.user_id = r.user_id
-- group by r.contest_id
-- order by percentage desc, r.contest_id asc

select r.contest_id, coalesce(round(count(r.user_id) / (select count( distinct user_id) from Users) * 100, 2), 0) as percentage
from Users as u
left join Register as r
on u.user_id = r.user_id
where r.contest_id is not null
group by r.contest_id
order by percentage desc, r.contest_id asc