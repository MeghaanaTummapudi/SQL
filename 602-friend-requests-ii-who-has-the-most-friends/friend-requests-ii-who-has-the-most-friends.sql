# Write your MySQL query statement below

with testing as (
select requester_id, count(*) as n_c
from requestaccepted
group by requester_id
),

test2 as (
    select accepter_id, count(*) as nc
    from requestaccepted
    group by accepter_id 

),

un as (

select *
from testing

union all 

select *
from test2
)

select requester_id as id, sum(n_c) as num
from un
group by requester_id
order by num desc
limit 1