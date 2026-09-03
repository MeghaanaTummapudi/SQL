# Write your MySQL query statement below

with testing as (
select *, lag(arrival_time, 1, -1) over (order by arrival_time asc) as prev_time
from buses
), 

testing2 as (
select t.bus_id, count(*) as n_c
from passengers as p
left join testing as t
on p.arrival_time <= t.arrival_time and p.arrival_time > t.prev_time
group by t.bus_id
)

select b.bus_id, ifnull(t2.n_c, 0) as passengers_cnt
from buses as b
left join testing2 as t2
on b.bus_id = t2.bus_id
order by b.bus_id asc

