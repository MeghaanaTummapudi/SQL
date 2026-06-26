# Write your MySQL query statement below

with testing as (
select *, ceil(minute / 6) as n_c
from orders
)

-- select distinct n_c as interval_no, sum(order_count) over (partition by n_c) as total_orders
-- from testing
-- order by interval_no asc

select n_c as interval_no, sum(order_count) as total_orders
from testing
group by n_c
order by interval_no asc