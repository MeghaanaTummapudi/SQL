# Write your MySQL query statement below

with testing as (
select *, row_number() over () as rn, 
       lag(giver_id, 1) over () as l1, 
       lag(receiver_id, 1) over() as l2
from secretsanta
), 

testing2 as (
select rn, l1, l2, giver_id, receiver_id, gift_value, 
       sum(case when l2 = giver_id then 0 else 1 end) over (order by rn) as s1
from testing
), 

testing3 as (
select *, 
       first_value(giver_id) over (partition by s1 order by rn) as f1, 
       last_value(receiver_id) over (partition by s1 order by rn ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) as r1
from testing2
)

select  row_number() over () as chain_id, t.*
from (select distinct count(*) as chain_length, sum(gift_value) as total_gift_value
from testing3
where f1 = r1
group by s1
order by chain_length desc, total_gift_value desc) as t

