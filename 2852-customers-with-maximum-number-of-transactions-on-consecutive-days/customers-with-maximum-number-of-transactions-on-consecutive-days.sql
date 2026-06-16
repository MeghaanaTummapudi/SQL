# Write your MySQL query statement below

with testing as (
select t.*, date_sub(t.transaction_date, interval t.rn day) as find
from (select *, row_number() over (partition by customer_id order by transaction_date asc) as rn
from transactions) as t
), 

testing2 as (
select customer_id, count(*) as n_c
from testing
group by customer_id, find
)

select customer_id
from testing2
where (n_c) in (select max(n_c) from testing2)
order by customer_id asc

