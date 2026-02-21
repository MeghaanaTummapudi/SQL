# Write your MySQL query statement below

with testing as (
select t.product_id, t.order_id, t.order_date
from (select *, 
       dense_rank() over (partition by product_id order by order_date desc)  as dr from orders) as t
where t.dr = 1
)

select p.product_name, t.product_id, t.order_id, t.order_date
from testing as t
left join products as p
on t.product_id = p.product_id
order by p.product_name, p.product_id, t.order_id asc


