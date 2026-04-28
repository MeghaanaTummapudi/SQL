# Write your MySQL query statement below

select p.name, sum(ifnull(i.rest, 0)) as rest, sum(ifnull(i.paid, 0)) as paid, sum(ifnull(i.canceled, 0)) as canceled, sum(ifnull(i.refunded, 0)) as refunded
from product as p
left join invoice as i
on p.product_id = i.product_id
group by p.product_id
order by p.name

