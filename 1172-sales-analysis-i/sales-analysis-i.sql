# Write your MySQL query statement below

-- select seller_id
-- from sales
-- group by seller_id
-- having sum(price) = (select max(t.sp)
--                      from (select sum(price) as sp
--                      from sales
--                      group by seller_id) as t
--                     )

-- select t2.seller_id
-- from (select t.seller_id, dense_rank() over (order by t.sp desc) as dr
-- from (select distinct seller_id, 
--        sum(price) over (partition by seller_id) as sp
-- from sales) as t) as t2
-- where t2.dr = 1

with testing as (
select seller_id, sum(price) as sp
from sales
group by seller_id
)

select seller_id
from testing
where (sp) in (select max(sp) from testing)
