# Write your MySQL query statement below

-- with testing as (
-- select user2 as id1, user1 as id2
-- from friends
-- where user1 > user2

-- union all

-- select user1 as id1, user2 as id2
-- from friends
-- where user1 < user2
-- order by id1, id2
-- )

with testing as (
select user1 as id
from friends

union 

select user2 as id
from friends
), 

testing2 as (
select user2 as id1, user1 as id2
from friends
where user1 > user2

union all

select user1 as id1, user2 as id2
from friends
where user1 < user2
order by id1, id2
), 

testing3 as (
select id1 as id, count(distinct id2) as n1
from testing2
group by id1

union all

select id2 as id, count(distinct id1) as n1
from testing2
group by id2
)

select id as user1, round(sum(n1) * 100 / (select count(distinct id) from testing), 2) as percentage_popularity
from testing3
group by id
order by id asc