# Write your MySQL query statement below

-- select s.product_id, s.year as first_year, s.quantity, s.price
-- from Sales as s
-- where (product_id, year) in (select product_id, min(year) from Sales group by product_id)

with testing as (
select product_id, min(year) as min_year
from sales
group by product_id
)

select t.product_id, t.min_year as first_year, s.quantity, s.price
from testing as t
left join sales as s
on t.product_id = s.product_id and t.min_year = s.year