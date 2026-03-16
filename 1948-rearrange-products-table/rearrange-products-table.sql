# Write your MySQL query statement below

select product_id, 'store1' as store,
       (case when product_id is not null then store1 else null end) as price
from products
where store1 is not null
-- group by product_id, store1


union all

select product_id, 'store2' as store,
       (case when product_id is not null then store2 else null end) as price
from products
where store2 is not null
-- group by product_id, store2

union all

select product_id, 'store3' as store,
       (case when product_id is not null then store3 else null end) as price
from products
where store3 is not null
-- group by product_id, store3