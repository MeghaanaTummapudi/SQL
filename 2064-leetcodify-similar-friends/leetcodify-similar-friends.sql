# Write your MySQL query statement below

with testing as (
select distinct user_id, song_id, day
from listens 
),

testing2 as (
select t1.user_id as id1, t2.user_id as id2
from testing as t1
left join testing as t2 
on t1.user_id < t2.user_id
where t1.song_id = t2.song_id and t1.day = t2.day
group by t1.user_id, t2.user_id, t2.day
having count(*) >= 3
order by t1.user_id, t2.user_id
)

select distinct f.user1_id as user1_id, f.user2_id as user2_id
from friendship as f
join testing2 as t2
on f.user1_id = t2.id1 and f.user2_id = t2.id2
where f.user1_id < f.user2_id