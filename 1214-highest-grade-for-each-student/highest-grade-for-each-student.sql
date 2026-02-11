# Write your MySQL query statement below

-- select t.student_id, t.course_id, t.grade
-- from (select *, 
--         dense_rank() over (partition by student_id order by grade desc, course_id asc) as dr from enrollments) as t
-- where  t.dr = 1
-- order by t.student_id asc

with testing as (
select *
from enrollments
where (student_id, grade) in (select student_id, max(grade) from enrollments group by student_id) 
)

select *
from testing
where (student_id, course_id) in (select student_id, min(course_id) from testing group by student_id)
order by student_id asc