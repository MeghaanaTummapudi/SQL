# Write your MySQL query statement below

with testing as (
select b.box_id, ifnull(b.apple_count, 0) + ifnull(c.apple_count, 0) as apple_count, ifnull(b.orange_count, 0) + ifnull(c.orange_count, 0) as orange_count
from boxes as b
left join chests as c
on b.chest_id = c.chest_id
)

select sum(apple_count) as apple_count, sum(orange_count) as orange_count
from testing


