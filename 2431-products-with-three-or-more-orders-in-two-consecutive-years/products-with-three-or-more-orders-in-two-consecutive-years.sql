# Write your MySQL query statement below

with testing as (
select product_id, year(purchase_date) as yr, count(*) as n_c
from orders
group by product_id, year(purchase_date)
having n_c >= 3
)

select distinct t.product_id
from (select *, 
       lead(yr, 1) over (partition by product_id order by yr asc) as ln1
from testing) as t
where (t.ln1 - t.yr) = 1






-- select *, 
--        count(*) over (partition by product_id, year(purchase_date)) as n_c
-- from orders