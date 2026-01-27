# Write your MySQL query statement below
with testing as (
select distinct customer_id
from customer
),

testing2 as (
select distinct t.customer_id
from testing as t
cross join product as p
left join customer as c
on t.customer_id = c.customer_id and p.product_key = c.product_key
where c.customer_id is null
)

select *
from testing
where customer_id not in (select customer_id from testing2)