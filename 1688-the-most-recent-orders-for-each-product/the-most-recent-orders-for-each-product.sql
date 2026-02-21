# Write your MySQL query statement below

-- with testing as (
-- select t.product_id, t.order_id, t.order_date
-- from (select *, 
--        dense_rank() over (partition by product_id order by order_date desc)  as dr from orders) as t
-- where t.dr = 1
-- )

-- select p.product_name, t.product_id, t.order_id, t.order_date
-- from testing as t
-- left join products as p
-- on t.product_id = p.product_id
-- order by p.product_name, p.product_id, t.order_id asc


# trying with group by and without joins

-- select product_id, order_id, order_date
-- from orders as o
-- where (product_id, order_date) in (select product_id, max(order_date) from orders group by product_id)


select p.product_name, o.product_id, o.order_id, o.order_date
from orders as o
join products as p
on o.product_id = p.product_id
where (o.product_id, o.order_date) in (select product_id, max(order_date) from orders group by product_id)
order by p.product_name, p.product_id, o.order_id asc