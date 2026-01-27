# Write your MySQL query statement below

# finding min order_date and then join with delivery table and then performing the aggregation - complex way of solving it
-- with testing as (
-- select delivery_id, customer_id, min(order_date) as first_order
-- from delivery
-- group by customer_id
-- )

-- select round((sum(case when d.order_date = d.customer_pref_delivery_date then 1 else 0 end) / count( distinct d.customer_id)) * 100, 2) as immediate_percentage
-- from testing as t
-- left join delivery as d
-- on d.customer_id = t.customer_id and d.order_date = t.first_order


select round((sum(case when order_date = customer_pref_delivery_date then 1 else 0 end) / count(distinct customer_id)) * 100, 2) as immediate_percentage
from delivery 
where (customer_id, order_date) in (select customer_id, min(order_date) from delivery group by customer_id)