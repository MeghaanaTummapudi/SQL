# Write your MySQL query statement below

with testing as (
select product_id, product_name, (width * length * height) as tot
from products
)

select w.name as warehouse_name, sum(w.units * t.tot) as volume
from warehouse as w 
left join testing as t
on w.product_id = t.product_id
group by w.name