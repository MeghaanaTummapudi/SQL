# Write your MySQL query statement below

with testing as (
select delivery_id, customer_id, min(order_date) as first_order
from delivery
group by customer_id
)

-- (sum(case when d.order_date = d.customer_pref_delivery_date then 1 else 0 end) / count( distinct d.customer_id)) * 100 as immediate_percentage
select round((sum(case when d.order_date = d.customer_pref_delivery_date then 1 else 0 end) / count( distinct d.customer_id)) * 100, 2) as immediate_percentage
from testing as t
left join delivery as d
on d.customer_id = t.customer_id and d.order_date = t.first_order