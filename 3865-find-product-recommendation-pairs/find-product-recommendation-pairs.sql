# Write your MySQL query statement below

with testing as (
select p1.product_id as p1id, p2.product_id as p2id, count(distinct p1.user_id) as cust_count
from productpurchases as p1
join productpurchases as p2
on p1.user_id = p2.user_id and p1.product_id <> p2.product_id and p1.product_id < p2.product_id
group by p1.product_id, p2.product_id
having cust_count >= 3
order by p1.product_id, p2.product_id
)

select t.p1id as product1_id, t.p2id as product2_id, i.category as product1_category, i2.category as product2_category, t.cust_count as customer_count
from testing as t
join productinfo as i
on t.p1id = i.product_id
join productinfo as i2
on t.p2id = i2.product_id
order by customer_count desc, product1_id asc, product2_id asc