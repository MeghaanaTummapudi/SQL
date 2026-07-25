# Write your MySQL query statement below

with testing as (
select *, row_number() over (partition by employee_id order by start_time) as rn
from employeeshifts
)

select e1.employee_id, count(*) as overlapping_shifts
from testing as e1
join testing as e2
on e1.employee_id = e2.employee_id and e1.rn < e2.rn
where (e2.start_time between e1.start_time and e1.end_time) or (e2.end_time between e1.start_time and e1.end_time)
group by e1.employee_id
order by e1.employee_id asc