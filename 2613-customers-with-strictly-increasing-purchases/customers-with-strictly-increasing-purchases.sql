# Write your MySQL query statement below

with recursive cte as (

    select customer_id, min(year(order_date)) as n, max(year(order_date)) as c
    from orders 
    group by customer_id

    union all

    select customer_id, n+1, c
    from cte as c
    where n + 1 <= c

), 

testing2 as (
select customer_id, n as years
from cte
order by customer_id
),

testing3 as (
select t2.customer_id, t2.years, ifnull(sum(o.price), 0) as tot
from testing2 as t2
left join orders as o
on t2.customer_id = o.customer_id and t2.years = year(o.order_date)
group by t2.customer_id, t2.years
order by t2.customer_id, t2.years
),

testing4 as (
-- select t3.customer_id, t3.years as yr1, t3.tot as tot1, t4.years as yr2, t4.tot as tot2
-- from testing3 as t3
-- join testing3 as t4
-- on t3.customer_id = t4.customer_id and t4.years = t3.years + 1

select *, 
       ifnull(lag(tot, 1) over (partition by customer_id order by years), 0) as l1
from testing3
)

select customer_id
from (select customer_id, 
       min(case when  tot > l1 then 1 else 0 end) as tst
from testing4
group by customer_id) as t
where t.tst = 1

-- select *
-- from testing4
