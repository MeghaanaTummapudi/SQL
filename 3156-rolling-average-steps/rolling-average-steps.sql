# Write your MySQL query statement below

with testing as (
select *, 
       lead(steps_date, 1) over (partition by user_id order by steps_date) as d1, 
       lead(steps_count, 1) over (partition by user_id order by steps_date) as c1,
       lead(steps_date, 2) over (partition by user_id order by steps_date) as d2, 
       lead(steps_count, 2) over (partition by user_id order by steps_date) as c2
from steps 
)

select user_id, d2 as steps_date, round((steps_count + c1 + c2) / 3, 2) as rolling_average
from testing
where datediff(d1, steps_date) = 1 and datediff(d2, d1) = 1
order by user_id, steps_date asc