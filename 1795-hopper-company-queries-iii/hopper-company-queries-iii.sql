# Write your MySQL query statement below

with recursive cte as (

    select 1 as mon

    union 

    select mon + 1 
    from cte
    where mon < 12
), 

testing as (

select month(r.requested_at) as mon, sum(a.ride_distance) as dist, sum(a.ride_duration) as dur
from acceptedrides as a
join rides as r
on a.ride_id = r.ride_id
where year(r.requested_at) = 2020
group by month(r.requested_at)
), 

testing2 as (
select c.mon, 
       round(avg(ifnull(t.dist, 0)) over (order by c.mon asc rows between current row and 2 following), 2) as average_ride_distance, 
       round(avg(ifnull(t.dur, 0)) over (order by c.mon asc rows between current row and 2 following), 2) as average_ride_duration 
from cte as c
left join testing as t
on c.mon = t.mon
)

select mon as month, average_ride_distance, average_ride_duration 
from testing2
where mon <= 10
