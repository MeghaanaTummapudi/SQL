# Write your MySQL query statement below

select *
from customers
where customer_id in (select customer_id from orders where product_name = 'A') and customer_id in (select customer_id from orders where product_name = 'B') and customer_id not in (select customer_id from orders where product_name = 'C')
order by customer_id