# Write your MySQL query statement below

with testing as (
select *, row_number() over (partition by employee_id order by start_time asc) as rn
from employeeshifts
), 

testing2 as (
select t1.rn as rn1, t1.employee_id, t1.start_time as st1, t1.end_time as et1, t2.rn as rn2, t2.start_time as st2, t2.end_time as et2
from testing as t1
left join testing as t2
on t1.employee_id = t2.employee_id and t1.rn < t2.rn
where (t2.start_time between t1.start_time and t1.end_time) 
),

testing3 as (
select rn1, employee_id, rn2, (case when st2 > st1 and st2 < et1 then timestampdiff(minute, st2, et1)
-- when st2 > st1 and st2 > et1 then timestampdiff(minute, st2, et2)
else null end) as tsts
from testing2
),


testing4 as (
select t.employee_id, max(t.n_c) as tot_c
from (select employee_id, count(rn2) as n_c
from testing3
group by employee_id, rn1) as t
group by t.employee_id
), 

testing5 as (
select employee_id, sum(tsts) as time_olp
from testing3 
group by employee_id

)

select distinct es.employee_id, ifnull(tot_c, 0) + 1 as max_overlapping_shifts, ifnull(time_olp, 0) as  total_overlap_duration
from employeeshifts as es
left join testing4 as t
on es.employee_id = t.employee_id
left join testing5 as t2
on es.employee_id = t2.employee_id
order by es.employee_id asc