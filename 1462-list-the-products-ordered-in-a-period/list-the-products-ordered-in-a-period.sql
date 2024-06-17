# Write your MySQL query statement below

select p.product_name, sum(o.unit) as unit
from products as p
left join orders as o
on p.product_id = o.product_id
where month(order_date) = 02 and year(order_date) = 2020
group by o.product_id
having unit >= 100