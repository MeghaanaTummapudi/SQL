# Write your MySQL query statement below

with testing as (
select *, 
       avg(quantity) over (partition by order_id) as av, 
       max(quantity) over (partition by ordeR_id) as ma
from ordersdetails
)

select distinct t.order_id
from (select *, 
       max(av) over () as mav
from testing) as t
where t.ma > t.mav
order by t.order_id asc
