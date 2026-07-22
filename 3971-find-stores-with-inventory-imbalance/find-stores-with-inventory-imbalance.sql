# Write your MySQL query statement below

with prods as (
select store_id
from inventory
group by store_id
having count(distinct product_name) >= 3
), 

prices as (
select store_id, max(price) as ma, min(price) as mi
from inventory
where store_id in (select store_id from prods)
group by store_id
), 

exp_prod as (
select store_id, product_name as most_exp_prod, quantity as exp_qt
from inventory
where (store_id, price) in (select store_id, ma from prices)
), 

cheap_prod as (
select store_id, product_name as cheapest_prod, quantity as cheap_qt
from inventory
where (store_id, price) in (select store_id, mi from prices)
), 

tot as (
select e.store_id, e.most_exp_prod, c.cheapest_prod, round(c.cheap_qt / e.exp_qt, 2) as imbalance_ratio
from exp_prod as e
join cheap_prod as c
on e.store_id = c.store_id
where e.exp_qt < c.cheap_qt
)

select t.store_id, s.store_name, s.location, t.most_exp_prod as most_exp_product, t. cheapest_prod as cheapest_product, t.imbalance_ratio
from tot as t
left join stores as s
on t.store_id = s.store_id
order by t.imbalance_ratio desc, s.store_name asc