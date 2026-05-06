# Write your MySQL query statement below

-- select *
-- from passengers as p1
-- left join buses as b1
-- on p1.arrival_time <= b1.arrival_time
-- join buses as b2
-- on b2.arrival_time < b1.arrival_time and p1.arrival_time <= b2.arrival_time

with testing as (
select p1.passenger_id, p1.arrival_time as p1_time, b1.bus_id, b1.arrival_time as b1_time
from passengers as p1
left join buses as b1
on p1.arrival_time <= b1.arrival_time
), 

testing2 as (
select t.bus_id, t.passenger_id
from (select *, dense_rank() over (partition by passenger_id order by b1_time, p1_time asc) as rn
from testing) as t
where t.rn = 1
), 

testing3 as (
select bus_id, count(passenger_id) as n_c
from testing2
group by bus_id
)

select b.bus_id, ifnull(t3.n_c, 0) as passengers_cnt 
from buses as b
left join testing3 as t3
on b.bus_id = t3.bus_id
order by b.bus_id asc
