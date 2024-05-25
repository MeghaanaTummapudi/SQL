# Write your MySQL query statement below

with fo as (
select customer_id, min(order_date) as first_order
from delivery
group by customer_id
)

select round((count(distinct f.customer_id)/ (select count(distinct customer_id) from fo)  * 100), 2)as immediate_percentage
from delivery as d
left join fo as f
on d.customer_id = f.customer_id and d.order_date = d.customer_pref_delivery_date and d.order_date = f.first_order
-- im as (
-- select *
-- from delivery
-- where order_date = customer_pref_delivery_date
-- )

-- select *
-- from fo as f
-- left join im as m
-- on f.customer_id = m.customer_id












































































-- -- where order_date = customer_pref_delivery_date 

-- with testing as (
-- select d1.delivery_id, d1.customer_id, d1.order_date, d1.customer_pref_delivery_date 
-- from delivery as d1
-- inner join delivery as d2
-- on d1.customer_pref_delivery_date < d2.customer_pref_delivery_date
-- where d1.order_date = d1.customer_pref_delivery_date
-- group by d1.customer_id
-- )


-- -- round((count(*)/(select count(distinct customer_id) from delivery) * 100), 2) as immediate_percentage
-- select *
-- from testing