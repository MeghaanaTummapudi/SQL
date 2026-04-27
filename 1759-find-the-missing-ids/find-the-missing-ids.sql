# Write your MySQL query statement below

with recursive cte as (

select 1 as n

union all

select n+1 
from cte 
where n < (select max(customer_id) from customers)
)

select distinct ct.n as ids
from cte as ct
left join customers as c
on ct.n = c.customer_id
where c.customer_id is null
order by ct.n asc