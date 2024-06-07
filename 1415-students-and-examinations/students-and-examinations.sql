
-- select *
-- from students as s
-- left join examinations as e
-- on s.student_id = e.student_id
-- right join subjects as sub
-- on e.subject_name <> sub.subject_name

with testing as (
select *
from students as s
cross join subjects as sub
)


select t.student_id, t.student_name, t.subject_name, count(e.student_id) as attended_exams
from testing as t
left join examinations as e
on t.student_id = e.student_id and t.subject_name = e.subject_name
group by t.student_id, t.subject_name
order by t.student_id, t.subject_name asc
