# Write your MySQL query statement below

with testing as
(select customer_number, count(order_number) as c
from orders as o
group by customer_number)


select customer_number
from testing
where c in (select max(c) from testing )