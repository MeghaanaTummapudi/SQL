# Write your MySQL query statement below

with testing as (
select s.student_id, s.name as stud_name, s.major, c.course_id, c.name
from students as s
cross join courses as c
on s.major = c.major
order by s.student_id, c.course_id
), 

testing2 as (
select distinct t.student_id
from testing as t
left join enrollments as e 
on t.student_id = e.student_id and t.course_id = e.course_id
where e.course_id is null or e.grade <> 'A'
order by t.student_id, e.course_id
)

select student_id
from students 
where student_id not in (select student_id from testing2)
order by student_id asc