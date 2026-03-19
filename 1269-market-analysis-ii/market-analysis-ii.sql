# Write your MySQL query statement below

with testing as (
select t.seller_id, t.item_id, t.order_date
from (select seller_id, item_id, order_date, 
    row_number() over (partition by seller_id order by order_date asc) as r
from orders ) as t
where t.r = 2
)

select u.user_id as seller_id, if(i.item_brand = u.favorite_brand, 'yes', 'no') as 2nd_item_fav_brand
    --    (case when i.item_brand = u.favorite_brand then 'yes' else 'no' end) as 2nd_item_fav_brand
from testing as t
join items as i
on t.item_id = i.item_id
right join users as u
on t.seller_id = u.user_id


