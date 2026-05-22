# Write your MySQL query statement below

with testing as (
select distinct driver_id as id
from rides
)

select t.id as driver_id, ifnull(count(distinct ride_id), 0) as cnt
from testing as t
left join rides as r
on t.id = r.passenger_id
group by t.id