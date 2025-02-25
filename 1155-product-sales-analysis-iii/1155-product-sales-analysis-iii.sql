# Write your MySQL query statement below

select s.product_id, s.year as first_year, s.quantity, s.price
from Sales as s
where (product_id, year) in (select product_id, min(year) from Sales group by product_id)
