# Write your MySQL query statement below

-- select product_id, sum(quantity) as total_quantity
-- from sales 
-- group by product_id 

select distinct product_id, sum(quantity) over (partition by product_id) as total_quantity
from sales
