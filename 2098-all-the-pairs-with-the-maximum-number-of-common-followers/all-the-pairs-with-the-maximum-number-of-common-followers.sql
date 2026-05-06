# Write your MySQL query statement below

with testing as (
select r1.user_id as id1, r2.user_id as id2, count(r2.follower_id) as n_c
from relations as r1
left join relations as r2
on r1.user_id < r2.user_id and r1.follower_id = r2.follower_id
where r2.user_id is not null
group by r1.user_id, r2.user_id
order by r1.user_id, r2.user_id
)

select id1 as user1_id, id2 as user2_id
from testing
where n_c in (select max(n_c) from testing)