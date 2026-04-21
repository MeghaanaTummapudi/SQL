# Write your MySQL query statement below


with recursive cte as (
 
    select 1 as mon

    union all

    select mon + 1
    from cte
    where mon < 12

),


testing as (
select month(join_date) as mon, count(*) as dr_count
from drivers
where year(join_date) = 2020
group by month(join_date)
), 

testing2 as (
select count(*) as base
from drivers
where year(join_date) < 2020
), 

testing3 as (
select month(r.requested_at) as mon, count(*) as accepted_rides
from acceptedrides as a
join rides as r
on a.ride_id = r.ride_id
where year(r.requested_at) = 2020
group by month(r.requested_at)

)

select ct.mon as month, ifnull(sum(dr_count) over (order by ct.mon asc) + (select base from testing2), 0) as active_drivers, ifnull(t3.accepted_rides, 0) as accepted_rides
from cte as ct 
left join testing as t
on ct.mon = t.mon
left join testing3 as t3
on ct.mon = t3.mon
order by ct.mon asc

