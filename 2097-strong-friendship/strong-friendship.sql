# Write your MySQL query statement below

with testing as (
select user1_id as id1, user2_id as id2
from friendship 

union all

select user2_id as id1, user1_id as id2
from friendship
)

select t.id1 as user1_id, t.id2 as user2_id, count(t3.id1) as common_friend
from testing as t
join testing as t2
on t.id1 = t2.id1
join testing as t3
on t.id2 = t3.id1 and t2.id2 = t3.id2
group by t.id1, t.id2
having count(t3.id1) >= 3 and id1 < id2