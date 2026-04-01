# Write your MySQL query statement below

-- select user_id, activity_type, count(*) as n_c, avg(activity_duration) as avg_d
-- from useractivity
-- group by user_id, activity_type
with testing as (
select user_id, activity_type, 
       round(avg(case when activity_type = 'free_trial' then activity_duration else 0 end), 2) as trail_d, 
        round(avg(case when activity_type = 'paid' then activity_duration
        else 0 end), 2) as paid_d
from useractivity
where activity_type <> 'cancelled'
group by user_id, activity_type
)

select user_id, max(case when user_id then trail_d else 0 end) as trial_avg_duration, 
max(case when user_id then paid_d else 0 end) as paid_avg_duration
from testing
group by user_id
having trial_avg_duration != 0 and paid_avg_duration != 0
order by user_id asc