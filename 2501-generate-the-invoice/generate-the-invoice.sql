# Write your MySQL query statement below

with testing as (
select t.invoice_id
from (select p1.invoice_id,
       dense_rank() over (order by (sum(p1.quantity * p2.price)) desc, invoice_id asc) as dr
from purchases as p1
left join products as p2
on p1.product_id = p2.product_id
group by p1.invoice_id) as t
where t.dr = 1
)

-- select *
-- from purchases as p1
-- left join products as p2
-- on p1.product_id = p2.product_id
-- where p1.invoice_id in (select invoice_id from testing)

select p1.product_id, p1.quantity, (p1.quantity * p2.price) as price
from testing as t
left join purchases as p1
on t.invoice_id = p1.invoice_id
left join products as p2
on p1.product_id = p2.product_id