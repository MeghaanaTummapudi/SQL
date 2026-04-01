# Write your MySQL query statement below

with testing as (
select student_id, count(subject), count(distinct subject) as cycle_l, sum(hours_studied) as tot_time
from study_sessions
group by student_id
having count(subject) >= 6 and count(distinct subject) >= 3 and count( subject) / count(distinct subject) >= 2
),

testing2 as (
select distinct s1.student_id
from study_sessions as s1
join study_sessions as s2
on s1.student_id = s2.student_id and (s2.session_id - s1.session_id = 1)
where datediff(s2.session_date, s1.session_date) > 2 
),

testing3 as (
select session_id, student_id, subject, 
       subject as subject2
from study_sessions
),

testing4 as (
select t3.student_id, t1.cycle_l, count(distinct t3.subject)
from testing3 as t3
join testing as t1
on t3.student_id = t1.student_id
join testing3 as t4
on t3.student_id = t4.student_id and t3.session_id + t1.cycle_l = t4.session_id
where t3.subject = t4.subject
group by t3.student_id
having t1.cycle_l = count(distinct t3.subject)
)


select t1.student_id, s.student_name, s.major, t1.cycle_l as cycle_length, t1.tot_time as total_study_hours
from testing as t1
left join students as s
on t1.student_id = s.student_id
join testing4 as t4
on t1.student_id = t4.student_id
where t1.student_id not in (select student_id from testing2)
order by t1.cycle_l desc, t1.tot_time desc

