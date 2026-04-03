# Write your MySQL query statement below

-- with testing as (
-- select pp1.user_id, pp1.product_id as p1id, pp2.product_id as p2id
-- from productpurchases as pp1
-- join productpurchases as pp2
-- on pp1.user_id = pp2.user_id and pp1.product_id < pp2.product_id
-- )

-- select *
-- from testing as t
-- where 

with testing as (
select pp.user_id, i.category
from productpurchases as pp
join productinfo as i
on pp.product_id = i.product_id
)

select  t1.category as category1, t2.category as category2, count(distinct t1.user_id) as customer_count
from testing as t1
join testing as t2
on t1.user_id = t2.user_id and t1.category < t2.category
group by t1.category, t2.category
having customer_count >= 3
order by customer_count desc, t1.category asc, t2.category asc