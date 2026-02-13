# Write your MySQL query statement below

with testing as (
select o.customer_id, date_format(order_date, '%Y-%m') as dat, sum(p.price * o.quantity) as tot
from orders as o
join product as p
on o.product_id = p.product_id
where date_format(order_date, '%Y-%m') = '2020-06' or date_format(order_date, '%Y-%m') = '2020-07'
group by o.customer_id, date_format(order_date, '%Y-%m')
having tot >= 100
)

select customer_id, name
from customers
where customer_id in (select customer_id
                      from testing
                      group by customer_id
                      having count(*) > 1)

