# Write your MySQL query statement below

-- select  round((count(case when order_date = customer_pref_delivery_date then delivery_id else null end) / count(delivery_id)) * 100, 2) as immediate_percentage
-- from delivery

select round((sum(if(order_date = customer_pref_delivery_date, 1, 0)) / count(delivery_id)) * 100, 2) as immediate_percentage
from delivery