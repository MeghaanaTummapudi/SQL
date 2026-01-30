# Write your MySQL query statement below

-- select distinct sell_date, product, count(distinct product)
-- from activities
-- group by sell_date

select sell_date, count(distinct product) as num_sold, group_concat(distinct product order by product separator ',') as products
from activities
group by sell_date
order by sell_date
