# Write your MySQL query statement below

-- select *
-- from customers
-- where customer_id in (select customer_id from orders where product_name = 'A') and customer_id in (select customer_id from orders where product_name = 'B') and customer_id not in (select customer_id from orders where product_name = 'C')
-- order by customer_id

with t1 as (
select customer_id
from orders
where product_name = 'A'
), 

t2 as (
select customer_id
from orders
where product_name = 'B'
), 

t3 as (
select customer_id
from orders
where product_name = 'C'
)

select *
from customers 
where customer_id in (select customer_id from t1) and customer_id in (select customer_id from t2) and (customer_id not in (select customer_id from t3))
order by customer_id
