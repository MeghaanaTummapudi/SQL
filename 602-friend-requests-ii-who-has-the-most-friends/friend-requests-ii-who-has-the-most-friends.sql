# Write your MySQL query statement below

with testing as (
select requester_id as id1, accepter_id as id2
from RequestAccepted

union all

select accepter_id as id1, requester_id as id2
from RequestAccepted
), 


testing2 as (
select id1, count(id1) as n_c
from testing
group by id1
)

select id1 as id, n_c as num
from testing2
where n_c in (select max(n_c) from testing2)