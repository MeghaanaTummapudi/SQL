# Write your MySQL query statement below

with recursive cte as (
 
 select 1 as mon

 union 

 select mon + 1
 from cte
 where mon < 12
),

testing as (
select count(*) as base
from drivers
where year(join_date) < 2020
), 

testing2 as (
select month(join_date) as mon, count(*) as n_c
from drivers
where year(join_date) = 2020
group by month(join_date)
), 

avail_drivers as (
select c.mon as mon, (sum(ifnull(n_c, 0)) over (order by c.mon asc) + ifnull((select base from testing), 0))  as tot
from cte as c
left join testing2 as t2
on c.mon = t2.mon
), 

testing3 as (
select month(r.requested_at) as mon, count(distinct a.driver_id) as n_ct
from acceptedrides as a
join rides as r
on a.ride_id = r.ride_id
where year(r.requested_at) = 2020
group by month(r.requested_at)
)

select c.mon as month, ifnull(round((ifnull(t3.n_ct, 0) * 100) / (ad.tot), 2), 0) as working_percentage
from cte as c
left join testing3 as t3 
on c.mon = t3.mon
join avail_drivers as ad
on c.mon = ad.mon
order by c.mon