# Write your MySQL query statement below

with testing as (
select order_id, customer_id, order_type
from orders
where order_type = 0
)

select *
from orders
where (customer_id) not in (select customer_id from testing)
union all
select *
from testing