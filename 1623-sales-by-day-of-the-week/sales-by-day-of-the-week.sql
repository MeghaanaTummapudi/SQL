# Write your MySQL query statement below

-- with cte as (
-- select 'Monday' as dayn

-- union 

-- select 'Tuesday' as dayn

-- union 

-- select 'Wednesday' as dayn

-- union

-- select 'Thursday' as dayn

-- union

-- select 'Friday' as dayn

-- union

-- select 'Saturday' as dayn

-- union

-- select 'Sunday' as dayn
-- ),

-- testing as (
-- select i.item_category, dayname(o.order_date) as weekd, sum(o.quantity) as tot
-- from orders as o
-- left join items as i
-- on o.item_id = i.item_id
-- group by i.item_category, dayname(o.order_date)
-- ), 

-- testing2 as (
-- select distinct i.item_category, t.weekd, t.tot
-- from items as i
-- left join testing as t
-- on i.item_category = t.item_category
-- ), 

-- testing3 as (
-- select *, (case when c.dayn = t2.weekd then t2.tot else 0 end) as tst
-- from cte as c
-- cross join testing2 as t2
-- )

-- select item_category as category, 
--        max(case when dayn = 'Monday' then tst else 0 end) as Monday, 
--        max(case when dayn = 'Tuesday' then tst else 0 end) as Tuesday,
--         max(case when dayn = 'Wednesday' then tst else 0 end) as Wednesday,
--        max(case when dayn = 'Thursday' then tst else 0 end) as Thursday,
--        max(case when dayn = 'Friday' then tst else 0 end) as Friday, 
--        max(case when dayn = 'Saturday' then tst else 0 end) as Saturday,
--        max(case when dayn = 'Sunday' then tst else 0 end) as Sunday
-- from testing3
-- group by item_category
-- order by item_category


select i.item_category as category, 
       sum(case when dayname(o.order_date) = 'Monday' then o.quantity else 0 end) as Monday, 
       sum(case when dayname(o.order_date) = 'Tuesday' then o.quantity else 0 end) as Tuesday,
       sum(case when dayname(o.order_date) = 'Wednesday' then o.quantity else 0 end) as Wednesday,
       sum(case when dayname(o.order_date) = 'Thursday' then o.quantity else 0 end) as Thursday,
       sum(case when dayname(o.order_date) = 'Friday' then o.quantity else 0 end) as Friday,
       sum(case when dayname(o.order_date) = 'Saturday' then o.quantity else 0 end) as Saturday,
       sum(case when dayname(o.order_date) = 'Sunday' then o.quantity else 0 end) as Sunday
from items as i
left join orders as o
on i.item_id = o.item_id
group by i.item_category
order by i.item_category