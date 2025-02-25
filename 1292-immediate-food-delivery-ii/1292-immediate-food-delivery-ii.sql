# Write your MySQL query statement below

with testing as (
select customer_id, min(order_date) as min_order_date
from Delivery
group by customer_id
)

select round(count(*) * 100/(select count(distinct customer_id) from Delivery), 2) as immediate_percentage
from Delivery as d
left join testing as t
on d.customer_id = t.customer_id 
where d.customer_pref_delivery_date = t.min_order_date