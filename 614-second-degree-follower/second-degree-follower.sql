# Write your MySQL query statement below

with testing as (
select follower as follows, followee as being_followed
from follow
), 

testing2 as (
select follows, count(being_followed) as n
from testing
group by follows
having count(being_followed) >= 1
), 

testing3 as (
select being_followed, count(follows) as n
from testing
group by being_followed
having count(follows) >= 1
)

select t2.follows as follower, t3.n as num
from testing2 as t2
join testing3 as t3
on t2.follows = t3.being_followed
order by t2.follows asc
