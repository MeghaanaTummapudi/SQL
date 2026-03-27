# Write your MySQL query statement below

with order_count as (
select customer_id, count(customer_id) as tot
from restaurant_orders
group by customer_id
having count(customer_id) >= 3
), 

peak_hours as (
select customer_id, ceil((sum(case when (hour(order_timestamp) >= 11 and hour(order_timestamp) < 14) or (hour(order_timestamp) >= 18 and hour(order_timestamp) < 21) then 1 else 0 end) / count(*) ) * 100)  as tst
from restaurant_orders
group by customer_id

),


order_rate as (
select customer_id, round(avg(order_rating), 2) as avg_rating, (sum(case when order_rating is not null then 1 else 0 end) / count(*)) * 100 as tst1 
from restaurant_orders
group by customer_id
)



select o.customer_id, o.tot as total_orders, round(p.tst, 2) as peak_hour_percentage, r.avg_rating as average_rating
from order_count as o
join peak_hours as p
on o.customer_id = p.customer_id
join order_rate as r
on o.customer_id = r.customer_id
where p.tst >= 60 and r.avg_rating >= 4.0 and r.tst1 >= 50
order by r.avg_rating desc, o.customer_id desc




