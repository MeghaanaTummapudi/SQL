# Write your MySQL query statement below

with testing as (
select distinct user_id, song_id, day
from listens
),

testing2 as (
select t1.user_id as id1, t2.user_id as id2, t1.day, count(*) as n_c
from testing as t1
left join testing as t2
on t1.user_id < t2.user_id
where t1.day = t2.day and t1.song_id = t2.song_id
group by t1.user_id, t2.user_id, t1.day
having n_c >= 3
order by t1.user_id, t2.user_id
), 

testing3 as (
select t2.id1, t2.id2
from testing2 as t2
left join friendship as f
on t2.id1 = f.user1_id and t2.id2 = f.user2_id
where f.user1_id is null and f.user2_id is null
)

select id1 as user_id, id2 as recommended_id
from testing3


union 

select id2 as user_id, id1 as recommended_id
from testing3


