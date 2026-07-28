# Write your MySQL query statement below

with testing as (
select distinct v.fuel_type, v.driver_id, round(avg(t.rating) over (partition by v.fuel_type, v.driver_id), 2) as avg_rating
from trips as t
join vehicles as v
on t.vehicle_id = v.vehicle_id
), 

testing2 as (
select distinct d.driver_id, v.fuel_type, d.accidents, sum(t.distance) over (partition by d.driver_id, v.fuel_type) as tot_dist
from trips as t
join vehicles as v
on t.vehicle_id = v.vehicle_id
join drivers as d
on v.driver_id = d.driver_id
)

select t3.fuel_type, t3.driver_id, t3.avg_rating as rating, t3.tot_dist as distance
from (select t.fuel_type, t.driver_id, t.avg_rating, t2.tot_dist, rank() over (partition by t.fuel_type order by t.avg_rating desc, t2.tot_dist desc, t2.accidents asc) as rn
from testing as t
join testing2 as t2
on t.driver_id = t2.driver_id and t.fuel_type = t2.fuel_type) as t3
where t3.rn = 1
order by fuel_type asc


