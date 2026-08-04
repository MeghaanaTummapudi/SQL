# Write your MySQL query statement below

with testing as (
select *, lag(free, 1) over (order by seat_id) as l1
from cinema
), 

testing2 as (
select *, 
       sum(case when free = 1 and free = l1 then 0 else 1 end) over (order by seat_id) as n_c
from testing
),

testing3 as (
select t.n_c
from (select n_c, dense_rank() over (order by count(*) desc) as rn
from testing2
where free <> 0
group by n_c) as t
where t.rn = 1
)

select distinct first_value(seat_id) over (partition by n_c order by seat_id) as first_seat_id, last_value(seat_id) over (partition by n_c order by seat_id rows between unbounded preceding and unbounded following) as last_seat_id, count(*) over (partition by n_c order by seat_id rows between unbounded preceding and unbounded following) as consecutive_seats_len
from testing2
where n_c in (select n_c from testing3)
order by first_seat_id

