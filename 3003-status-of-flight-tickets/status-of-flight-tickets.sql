# Write your MySQL query statement below

with testing as (
select *, 
       cast(row_number() over (partition by flight_id order by booking_time asc)  as signed) as rn
from passengers
)

select t.passenger_id,  
       (case when f.capacity - t.rn >= 0 then 'Confirmed' else 'Waitlist' end) as Status
from testing as t
left join flights as f
on t.flight_id = f.flight_id
order by t.passenger_id asc