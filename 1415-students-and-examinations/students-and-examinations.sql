# Write your MySQL query statement below

with testing as (
select s.student_id, s.student_name, sub.subject_name, e.student_id as estud, e.subject_name as esub
from students as s
cross join subjects as sub
left join examinations as e
on s.student_id = e.student_id and sub.subject_name = e.subject_name
)

select student_id, student_name, subject_name, coalesce(count(esub), 0) as attended_exams
from testing
group by student_id, subject_name
order by student_id, subject_name