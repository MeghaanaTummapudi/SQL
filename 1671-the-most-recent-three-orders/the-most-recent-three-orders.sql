# Write your MySQL query statement below

with testing as (
select t.customer_id, t.order_id, t.order_date
from (select *, 
       dense_rank() over (partition by customer_id order by order_date desc) as dr
     from orders) as t
where t.dr = 1 or t.dr = 2 or t.dr = 3
)

select p.name as customer_name, t.customer_id, t.order_id, t.order_date
from testing as t
left join customers as p
on t.customer_id = p.customer_id
order by p.name asc, t.customer_id asc, t.order_date desc

