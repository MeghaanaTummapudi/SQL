# Write your MySQL query statement below

-- with testing as (
-- select distinct customer_id
-- from Customer
-- group by customer_id
-- ), 

-- testing_2 as (
-- select *
-- from testing as t
-- cross join Product as p
-- )

-- select c.customer_id
-- from testing_2 as t2
-- left join Customer as c
-- on t2.customer_id = c.customer_id and t2.product_key = c.product_key
-- group by t2.customer_id
-- having count(c.customer_id) = (select count(distinct product_key) from Product)

select distinct customer_id
from Customer
group by customer_id
having count(distinct product_key) = (select count(distinct product_key) from Product ) 