# Write your MySQL query statement below

select distinct p.product_name, sum(o.unit) as unit
from products as p
left join orders as o
on p.product_id = o.product_id
where month(o.order_date) = 2 and year(o.order_date) = 2020
group by p.product_id
having unit >= 100