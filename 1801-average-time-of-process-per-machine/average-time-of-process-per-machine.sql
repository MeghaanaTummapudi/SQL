# Write your MySQL query statement below

-- select *,
--        sum(case when a1.activity_type = a2.activity_type = 'start' then a1.timestamp end) as s
-- from activity as a1
-- inner join activity as a2
-- on a1.machine_id = a2.machine_id
-- -- group by a1.machine_id
-- order by a1.machine_id, a1.process_id asc

with testing as (
select a1.machine_id, a1.process_id, a1.activity_type, a2.activity_type as act2, (a1.timestamp - a2.timestamp) as diff
from activity as a1
join activity as a2
on a1.machine_id = a2.machine_id and a1.process_id = a2.process_id and a1.activity_type <> a2.activity_type
order by a1.machine_id, a1.process_id, a2.activity_type asc
)

select machine_id, round(avg(diff), 3) as processing_time
from testing
where activity_type = 'end' and act2 = 'start'
group by machine_id