# Write your MySQL query statement below

with testing as (
select *, 
       max(end_day) over (partition by hall_id order by start_day rows between unbounded preceding and 1 preceding) as l2
from hallevents
), 

testing2 as (
select *, 
       sum(case when start_day <= l2 then 0 else 1 end) over (partition by hall_id order by start_day) as tot_sum
from testing
)

select hall_id, min(start_day) as start_day, max(end_day) as end_day
from testing2
group by hall_id, tot_sum
order by hall_id, start_day, end_day

-- select *
-- from testing2