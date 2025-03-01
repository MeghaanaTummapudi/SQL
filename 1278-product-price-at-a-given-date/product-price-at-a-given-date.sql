# Write your MySQL query statement below

with testing as (
select *
from Products
where (product_id, change_date) in (select product_id, max(change_date)
                                    from products
                                    where change_date <= '2019-08-16'
                                    group by product_id
                                   )
)

select distinct p.product_id, coalesce(t.new_price, 10) as price
from Products as p
left join testing as t
on p.product_id = t.product_id