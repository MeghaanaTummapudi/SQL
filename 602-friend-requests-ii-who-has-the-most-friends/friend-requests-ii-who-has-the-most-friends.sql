# Write your MySQL query statement below

with f as (
select distinct requester_id as friends, count(*) as n_count
from RequestAccepted
group by requester_id
),
u as (
select distinct accepter_id as users, count(*) as n_count_u
from RequestAccepted
group by accepter_id
),

un as (
select *
from f 
union all
select *
from u 
)

select friends as id, sum(n_count) as num
from un
group by friends
order by num desc
limit 1


