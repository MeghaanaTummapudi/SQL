# Write your MySQL query statement below

-- with testing as (
-- select buyer_id
-- from sales as s
-- join product as p
-- on s.product_id = p.product_id
-- where p.product_name = 'S8'
-- )

-- select distinct buyer_id
-- from testing as t
-- where t.buyer_id not in (select buyer_id
-- from sales as s
-- join product as p
-- on s.product_id = p.product_id
-- where p.product_name = 'iPhone' )

with testing as (
select s.product_id, p.product_name, s.buyer_id
from sales as s
join product as p
on s.product_id = p.product_id
)

select distinct buyer_id
from testing
where buyer_id in (select buyer_id from testing where product_name = 'S8') and buyer_id not in (select buyer_id from testing where product_name = 'iPhone')

