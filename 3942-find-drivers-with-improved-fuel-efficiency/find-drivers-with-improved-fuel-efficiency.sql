# Write your MySQL query statement below

with testing as (
select distinct driver_id
from trips
group by driver_id
having count(distinct (case when month(trip_date) <= 6 then 0 else 1 end)) = 2
), 

testing2 as (
select driver_id, avg(case when month(trip_date) <= 6 then distance_km / fuel_consumed else null end) as first_avg, avg(case when month(trip_date) > 6 then distance_km / fuel_consumed else null end) as second_avg
from trips
where driver_id in (select driver_id from testing)
group by driver_id
)

select t2.driver_id, d.driver_name, round(t2.first_avg, 2) as first_half_avg, round(t2.second_avg, 2) as second_half_avg, round((t2.second_avg - t2.first_avg), 2) as efficiency_improvement
from testing2 as t2
left join drivers as d
on t2.driver_id = d.driver_id
where (t2.second_avg - t2.first_avg) > 0
order by efficiency_improvement desc, d.driver_name asc