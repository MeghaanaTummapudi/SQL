# Write your MySQL query statement below

with testing as (
select *, 
       (case when month(sale_date) = 12 or month(sale_date) = 1 or month(sale_date) = 2 then 'Winter'
            when month(sale_date) = 3 or month(sale_date) = 4 or month(sale_date) = 5 then 'Spring'
            when month(sale_date) = 6 or month(sale_date) = 7 or month(sale_date) = 8 then 'Summer'
            when month(sale_date) = 9 or month(sale_date) = 10 or month(sale_date) = 11 then 'Fall'
        else null end) as tsts
from sales
), 

testing2 as (
select t.tsts, t.quantity, t.price, p.category
from testing as t 
join products as p 
on t.product_id = p.product_id
), 

t3 as (
select t.*, rank() over (partition by tsts order by n_c desc, rev desc, category asc) as rn
from (select tsts, category, sum(quantity) as n_c, sum(quantity * price) as rev
      from testing2
      group by tsts, category) as t
)

select tsts as season, category, n_c as total_quantity, rev as total_revenue
from t3
where rn = 1
order by season asc