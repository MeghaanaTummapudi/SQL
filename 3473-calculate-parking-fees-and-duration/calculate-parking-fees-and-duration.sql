# Write your MySQL query statement below

-- with testing as (
-- select *, sum(fee_paid) over (partition by car_id) as tot_fee, 
--        sum(timestampdiff(minute, entry_time, exit_time)) over (partition by car_id) as tot_time, 
--        sum(timestampdiff(minute, entry_time, exit_time)) over (partition by car_id, lot_id) as time_lot
-- from ParkingTransactions
-- )

-- select distinct car_id, tot_fee, round((tot_fee / (tot_time / 60)), 2) as avg_fee
-- from testing

with testing as (
select car_id, sum(fee_paid) as tot_fee, sum(timestampdiff(minute, entry_time, exit_time))  as tot_time
from ParkingTransactions
group by car_id
), 

testing2 as (
select t1.car_id, t1.lot_id
from (select t.*, rank() over (partition by t.car_id order by t.time_lot desc) as rn
from (select car_id, lot_id, sum(timestampdiff(minute, entry_time, exit_time)) as time_lot
from ParkingTransactions
group by car_id, lot_id) as t) as t1
where t1.rn = 1
)

select t.car_id, t.tot_fee as total_fee_paid, round(t.tot_fee / (t.tot_time / 60), 2) as avg_hourly_fee, t2.lot_id as most_time_lot
from testing as t
join testing2 as t2
on t.car_id = t2.car_id
order by t.car_id asc