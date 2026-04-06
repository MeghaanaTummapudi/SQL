# Write your MySQL query statement below

-- with testing as (
-- select t.employee_id, t.meeting_date, date_sub(t.meeting_date, interval t.r day) as tst_week, t.duration_hours
-- from (select *,
--        dense_rank() over (partition by employee_id order by meeting_date) as r
-- from meetings) as t
-- ), 

-- testing2 as (
-- select employee_id, tst_week, sum(duration_hours) as tot
-- from testing
-- group by employee_id, tst_week
-- having tot > 20
-- )

-- select t2.employee_id, e.employee_name, e.department, count(t2.employee_id) as meeting_heavy_weeks
-- from testing2 as t2
-- left join employees as e
-- on e.employee_id = t2.employee_id 
-- group by t2.employee_id
-- having meeting_heavy_weeks >= 2
-- order by meeting_heavy_weeks desc, t2.employee_id asc



with testing as (
select *, week(meeting_date, 1) as n_w, year(meeting_date), sum(duration_hours) as tst
from meetings
group by employee_id, n_w, year(meeting_date)
having tst > 20
)

select t.employee_id, e.employee_name, e.department, count(*) as meeting_heavy_weeks
from testing as t
left join employees as e
on t.employee_id = e.employee_id
group by employee_id
having meeting_heavy_weeks >= 2
order by meeting_heavy_weeks desc, e.employee_name asc

-- select employee_id, meeting_date, duration_hours, n_w, tst
-- from testing
-- select employee_id, meeting_date, year(meeting_date), sum(duration_hours), week(meeting_date, 1) as n_w
-- from meetings
-- group by employee_id, n_w, year(meeting_date)