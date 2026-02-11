# Write your MySQL query statement below

with testing as (
select u.id, u.name, r.distance
from users as u
left join rides as r
on u.id = r.user_id
)

select name, coalesce(sum(distance), 0) as travelled_distance
from testing
group by id
order by travelled_distance desc, name asc
