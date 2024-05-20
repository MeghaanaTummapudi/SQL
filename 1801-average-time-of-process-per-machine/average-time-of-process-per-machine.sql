# Write your MySQL query statement below
-- with testing as (
-- select a1.machine_id,
--        (case when a1.activity_type = 'end' and a2.activity_type = 'start' then a1.timestamp - a2.timestamp
--        else null end) as t
-- from activity as a1
-- inner join activity as a2
-- on a1.machine_id = a2.machine_id and a1.process_id = a2.process_id 
-- )

-- select *
-- from testing
-- -- where t is not null
-- -- select machine_id, round(sum(t)/2, 3) as processing_time
-- -- from testing
-- -- where t is not null
-- -- group by machine_id


-- select a1.machine_id, round(avg(a1.timestamp - a2.timestamp), 3) as processing_time 
-- from activity as a1
-- inner join activity as a2
-- on a1.machine_id = a2.machine_id and a1.process_id = a2.process_id
-- where a1.activity_type = 'end' and a2.activity_type = 'start' 
-- group by a1.machine_id


WITH activity_with_times AS (
    SELECT 
        machine_id, 
        process_id,
        MAX(CASE WHEN activity_type = 'start' THEN timestamp END) OVER (PARTITION BY machine_id, process_id) AS start_time,
        MAX(CASE WHEN activity_type = 'end' THEN timestamp END) OVER (PARTITION BY machine_id, process_id) AS end_time
    FROM 
        activity
)
SELECT 
    machine_id, 
    ROUND(AVG(end_time - start_time), 3) AS processing_time
FROM 
    activity_with_times
WHERE 
    start_time IS NOT NULL AND end_time IS NOT NULL
GROUP BY 
    machine_id