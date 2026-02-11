# Write your MySQL query statement below

select s1.seller_name
from seller as s1
where s1.seller_id not in (select distinct s.seller_id
from seller as s
left join orders as o
on s.seller_id = o.seller_id
where year(o.sale_date) = 2020)
order by s1.seller_name asc
