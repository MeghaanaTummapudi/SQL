

with testing as (
select *
from students as s
cross join subjects as sub
)

select t.student_id, t.student_name, t.subject_name, count(e.subject_name) as attended_exams
from testing as t
left join examinations as e
on t.student_id = e.student_id and t.subject_name = e.subject_name
group by t.student_id, t.student_name, t.subject_name
order by t.student_id, t.subject_name



-- SELECT s.student_id, s.student_name, sub.subject_name, COUNT(e.student_id) AS attended_exams
-- FROM Students s
-- CROSS JOIN Subjects sub
-- LEFT JOIN Examinations e ON s.student_id = e.student_id AND sub.subject_name = e.subject_name
-- GROUP BY s.student_id, s.student_name, sub.subject_name
-- ORDER BY s.student_id, sub.subject_name;