# Write your MySQL query statement below

select t.student_id, t.course_id, t.grade
from (select *, 
        dense_rank() over (partition by student_id order by grade desc, course_id asc) as dr from enrollments) as t
where  t.dr = 1
order by t.student_id asc
