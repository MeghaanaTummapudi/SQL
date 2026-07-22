# Write your MySQL query statement below

with testing as (
select t.rn, t.giver_id, t.receiver_id, lag(t.giver_id, 1) over (order by t.rn) as l1, 
       lag(receiver_id, 1) over (order by t.rn) as l2, 
       t.gift_value
from (select *, 
       row_number() over () as rn
from secretsanta) as t
), 

testing2 as (
select t.*, first_value(giver_id) over (partition by tsts order by rn) as fs, 
       last_value(receiver_id) over (partition by tsts order by rn rows between unbounded preceding and unbounded following) as ls
from (select *, 
       sum(case when l2 = giver_id then 0 else 1 end) over (order by rn) as tsts
from testing) as t
)

select row_number() over () as chain_id, t.chain_length, t.total_gift_value
from (select distinct count(*) as chain_length, sum(gift_value) as total_gift_value
from testing2
where fs = ls
group by tsts) as t
order by chain_length desc, total_gift_value desc



