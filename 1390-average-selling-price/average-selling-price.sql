# Write your MySQL query statement below

with testing as (
select p.product_id, u.units, p.price, (u.units * p.price) as up
from prices as p
left join unitssold as u
on u.product_id = p.product_id and u.purchase_date between p.start_date and p.end_date 
)

-- product_id, round(sum(up) / sum(units), 2) as average_price
-- product_id, (case when units is null and up is null then 0 else round(sum(up) / sum(units), 2) end ) as average_price
select product_id, ifnull(round(sum(price * units) / sum(units), 2), 0) as average_price 
from testing
group by product_id