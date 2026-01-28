# Write your MySQL query statement below
# using ctes, cross join and then a not condition
-- with testing as (
-- select distinct customer_id
-- from customer
-- ),

-- testing2 as (
-- select distinct t.customer_id
-- from testing as t
-- cross join product as p
-- left join customer as c
-- on t.customer_id = c.customer_id and p.product_key = c.product_key
-- where c.customer_id is null
-- )

-- select *
-- from testing
-- where customer_id not in (select customer_id from testing2)

# subquery using cross join

-- select distinct customer_id
-- from customer 
-- where customer_id not in (select distinct c.customer_id
--                             from customer as c
--                             cross join product as p
--                             left join customer as c1
--                             on c.customer_id = c1.customer_id and p.product_key = c1.product_key
--                             where c1.customer_id is null)


select customer_id
from customer
group by customer_id
having count(distinct product_key) = (select count(*) from product)
