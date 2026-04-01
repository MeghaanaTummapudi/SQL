# Write your MySQL query statement below

-- with testing as (
-- select user_id, activity_type, 
--        round(avg(case when activity_type = 'free_trial' then activity_duration else 0 end), 2) as trail_d, 
--         round(avg(case when activity_type = 'paid' then activity_duration
--         else 0 end), 2) as paid_d
-- from useractivity
-- where activity_type <> 'cancelled'
-- group by user_id, activity_type
-- )

-- select user_id, max(case when user_id then trail_d else 0 end) as trial_avg_duration, 
-- max(case when user_id then paid_d else 0 end) as paid_avg_duration
-- from testing
-- group by user_id
-- having trial_avg_duration != 0 and paid_avg_duration != 0
-- order by user_id asc

with testing as (
select distinct user_id
from useractivity
where activity_type = 'free_trial' or activity_type = 'paid'
group by user_id
having count(distinct activity_type) = 2
)

select user_id, 
       round(avg(case when activity_type = 'free_trial' then activity_duration else null end), 2) as trial_avg_duration, 
        round(avg(case when activity_type = 'paid' then activity_duration
        else null end), 2) as paid_avg_duration
from useractivity
where user_id in (select user_id from testing)
group by user_id
order by user_id asc