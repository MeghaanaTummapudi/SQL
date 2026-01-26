# Write your MySQL query statement below

-- select machine_id, round((sum(case when activity_type = 'end' then timestamp else null end) - sum(case when activity_type = 'start' then timestamp else null end)) / count(distinct process_id), 3)  as processing_time 
-- from activity
-- group by machine_id

with testing as (
select machine_id, process_id,
       max(case when activity_type = 'start' then timestamp else null end) as start_ts,
       max(case when activity_type = 'end' then timestamp else null end) as end_ts
from activity
group by machine_id, process_id
)

select machine_id, round(sum(end_ts - start_ts) / count(process_id), 3) as processing_time
from testing
group by machine_id
