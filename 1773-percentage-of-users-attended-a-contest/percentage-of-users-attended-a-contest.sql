# Write your MySQL query statement below

with testing as (
select distinct contest_id 
from register 
)

select t.contest_id, round((count(r.user_id)/count(t.contest_id) * 100), 2) as percentage
from users as u
cross join testing as t
left join register as r
on u.user_id = r.user_id and t.contest_id = r.contest_id
group by t.contest_id
order by percentage desc, t.contest_id asc