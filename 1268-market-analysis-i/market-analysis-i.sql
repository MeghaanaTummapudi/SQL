# Write your MySQL query statement below

with testing as (
select u.user_id, count(*) as n_c
from users as u
join orders as o
on u.user_id = o.buyer_id
where year(o.order_date) = 2019
group by u.user_id
)

select u.user_id as buyer_id, u.join_date, ifnull(t.n_c, 0) as orders_in_2019
from users as u
left join testing as t
on u.user_id = t.user_id