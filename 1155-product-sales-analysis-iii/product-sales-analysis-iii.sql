# Write your MySQL query statement below

with testing as (
select sale_id, product_id, year, quantity, price, 
       dense_rank() over (partition by product_id order by year asc) as yr
from sales
order by yr asc
)

select product_id, year as first_year, quantity, price
from testing
where yr = 1