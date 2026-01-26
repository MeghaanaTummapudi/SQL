# Write your MySQL query statement below

select machine_id, round((sum(case when activity_type = 'end' then timestamp else null end) - sum(case when activity_type = 'start' then timestamp else null end)) / count(distinct process_id), 3)  as processing_time 
from activity
group by machine_id