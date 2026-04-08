# Write your MySQL query statement below

select seller_id
from sales
group by seller_id
having sum(price) = (select max(t.sp)
                     from (select sum(price) as sp
                     from sales
                     group by seller_id) as t
                    )