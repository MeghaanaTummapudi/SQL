# Write your MySQL query statement below

-- with testing as
-- (select customer_number, count(order_number) as c
-- from orders as o
-- group by customer_number)


-- select customer_number
-- from testing
-- where c in (select max(c) from testing )


select t.customer_number
from (select *, 
    rank() over (order by count(order_number) desc) as dr
    from orders 
    group by customer_number) as t
where t.dr = 1



