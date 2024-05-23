# Write your MySQL query statement below

with testing as (
select c.customer_id, count(distinct c.product_key) as c_p
from product as p
left join customer as c
on p.product_key = c.product_key
group by c.customer_id
),

test2 as (
select count(distinct product_key) as cpp
from product
)

select customer_id
from testing
where c_p = (select cpp from test2)

-- select *
-- from testing