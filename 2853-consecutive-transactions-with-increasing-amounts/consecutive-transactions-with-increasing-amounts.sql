# Write your MySQL query statement below

with testing as (
select t1.customer_id, t1.transaction_date
from transactions as t1
join transactions as t2
on t1.customer_id = t2.customer_id and datediff(t2.transaction_date, t1.transaction_date) = 1 and t2.amount > t1.amount
), 

testing2 as (
select t.customer_id, min(t.transaction_date) as mi, count(*) as n_c
from (select *, row_number() over (partition by customer_id order by transaction_date) as rn
from testing) as t
group by customer_id, date_sub(t.transaction_date, interval t.rn day)
)

select customer_id, mi as consecutive_start, date_add(mi, interval n_c day) as consecutive_end
from testing2
where n_c >= 2
order by customer_id, consecutive_start, consecutive_end