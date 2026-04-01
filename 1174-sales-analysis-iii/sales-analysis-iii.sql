# Write your MySQL query statement below

-- select product_id, product_name
-- from product
-- where product_id not in (select distinct product_id
--                          from sales
--                         where sale_date < '2019-01-01' or sale_date > '2019-03-31')

with testing as (
select s.product_id, p.product_name
from sales as s
left join product as p
on s.product_id = p.product_id
)

select distinct product_id, product_name
from testing 
where product_id not in (select distinct product_id
from sales
where sale_date < '2019-01-01' or sale_date > '2019-03-31')
