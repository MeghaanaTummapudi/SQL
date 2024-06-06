# Write your MySQL query statement below

select distinct product_id
from products
where low_fats = 'Y' and recyclable = 'Y'