# Write your MySQL query statement below

with testing as (
select buyer_id
from sales as s
join product as p
on s.product_id = p.product_id
where p.product_name = 'S8'
)

select distinct buyer_id
from testing as t
where t.buyer_id not in (select buyer_id
from sales as s
join product as p
on s.product_id = p.product_id
where p.product_name = 'iPhone' )
