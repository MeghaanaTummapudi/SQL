# Write your MySQL query statement below

select s.user_id, sum(s.quantity * p.price) as spending
from sales as s
left join product as p
on s.product_id = p.product_id
group by s.user_id
order by spending desc, user_id asc