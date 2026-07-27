# Write your MySQL query statement below

with testing as (
select *, row_number() over (partition by employee_id order by start_time asc) as rn
from tasks
), 

testing2 as (
select t1.rn as rn1, t1.employee_id, t1.start_time as st1, t1.end_time as et1, t2.rn as rn2, t2.start_time as st2, t2.end_time as et2
from testing as t1
left join testing as t2
on t1.employee_id = t2.employee_id and t1.rn < t2.rn
where t2.start_time >=  t1.start_time and t2.start_time < t1.end_time
),  

testing4 as (
select t.employee_id, max(t.n_c) as tot_nc
from (select employee_id, count(rn1) as n_c
from testing2
group by employee_id, rn1) as t
group by t.employee_id
), 

testing5 as (
select employee_id, sum(timestampdiff(minute, start_time, end_time)) as tot_time
from tasks
group by employee_id
), 


testing6 as (
select employee_id, rn1, count(rn1) as n_c
from testing2
group by employee_id, rn1
), 

testing7 as (
select employee_id, rn1
from testing6
where (employee_id, n_c) in (select employee_id, max(n_c) from testing6
                             group by employee_id)
), 

testing3 as (
-- select employee_id, sum(case when st2 > st1 and et2 > et1 then timestampdiff(minute, st2, et1)
--                when et2 < et1 then timestampdiff(minute, st2, et2)
--            else null end) as tsts
-- from testing2
-- group by employee_id
select employee_id, sum(case when st2 > st1 and et2 > et1 then timestampdiff(minute, st2, et1)
               when et2 < et1 then timestampdiff(minute, st2, et2)
           else null end) as tsts
from testing2
where (employee_id, rn1) in (select employee_id, rn1 from testing7)
group by employee_id
)

select t5.employee_id, floor((t5.tot_time - ifnull(t3.tsts, 0)) / 60) as total_task_hours, 1 + ifnull(t4.tot_nc, 0) as max_concurrent_tasks
from testing5 as t5
left join testing3 as t3
on t5.employee_id = t3.employee_id
left join testing4 as t4
on t5.employee_id = t4.employee_id
order by t5.employee_id asc