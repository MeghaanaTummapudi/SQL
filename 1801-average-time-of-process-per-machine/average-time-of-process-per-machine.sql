# Write your MySQL query statement below

-- select a1.machine_id, round(sum(a2.timestamp - a1.timestamp) / count(a1.machine_id), 3) as processing_time
-- from Activity as a1
-- inner join Activity as a2
-- on a1.machine_id = a2.machine_id and a1.process_id = a2.process_id
-- where a1.activity_type = 'start' and a2.activity_type = 'end'
-- group by a1.machine_id


select a1.machine_id, round(avg(a2.timestamp - a1.timestamp), 3) as processing_time
from Activity as a1
inner join Activity as a2
on a1.machine_id = a2.machine_id and a1.process_id = a2.process_id and a1.activity_type = 'start' and a2.activity_type = 'end'
group by a1.machine_id


-- SELECT machine_id,
--        ROUND(AVG(CASE WHEN activity_type = 'end' THEN timestamp END) - 
--              AVG(CASE WHEN activity_type = 'start' THEN timestamp END), 3) 
--        AS processing_time
-- FROM Activity
-- GROUP BY machine_id

