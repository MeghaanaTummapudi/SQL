# Write your MySQL query statement below

with testing as (
select flight_id, count(distinct passenger_id) as n_c
from passengers 
group by flight_id
), 

testing2 as (
select f.flight_id, t.n_c, (case when t.n_c >= f.capacity then f.capacity else t.n_c end) as booked_cnt 
from flights as f
left join testing as t
on f.flight_id = t.flight_id
)

select flight_id, ifnull(booked_cnt, 0) as booked_cnt, ifnull((n_c - booked_cnt), 0) as waitlist_cnt
from testing2
order by flight_id