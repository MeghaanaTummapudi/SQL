# Write your MySQL query statement below

with testing as (
select user_id, product_id, sum(quantity) as tot
from sales
group by user_id, product_id
)

select fin.user_id, fin.product_id
from (select t.user_id, t.product_id, 
       rank() over (partition by t.user_id order by (t.tot * p.price) desc) as rn
from testing as t
left join product as p
on t.product_id = p.product_id) as fin
where fin.rn = 1
