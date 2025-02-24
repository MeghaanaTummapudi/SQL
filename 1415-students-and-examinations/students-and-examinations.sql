# Write your MySQL query statement below

with testing as (
select *
from Students as s
cross join Subjects as sub
)

select t.student_id, t.student_name, t.subject_name, count(e.subject_name) as attended_exams
from testing as t
left join Examinations as e
on t.student_id = e.student_id and t.subject_name = e.subject_name
group by t.student_id, t.subject_name
order by t.student_id, t.subject_name