# Write your MySQL query statement below

-- with testing as (
-- select customer_id, product_id, count(product_id) as n_c
-- from orders
-- group by customer_id, product_id
-- order by customer_id 
-- )


-- select t.customer_id, t.product_id, p.product_name
-- from testing as t
-- left join products as p
-- on t.product_id = p.product_id
-- where (t.customer_id, t.n_c) in (select customer_id, max(n_c) from testing group by customer_id)


with testing as (
select *, 
       dense_rank() over (partition by customer_id order by count(product_id) desc) as dr
from orders 
group by customer_id, product_id
order by customer_id
)

select t.customer_id, t.product_id, p.product_name
from testing as t
left join products as p
on t.product_id = p.product_id
where t.dr = 1

