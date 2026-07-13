# Write your MySQL query statement below

with testing as (
select major, course_id
from courses
where mandatory = 'yes'
), 

testing2 as (
select major, course_id
from courses
where mandatory = 'no'
), 

testing3 as (
select distinct e.student_id, s.major, e.course_id, e.grade, e.gpa, c.mandatory
from students as s
join enrollments as e
on s.student_id = e.student_id
join courses as c
on s.major = c.major and c.course_id = e.course_id
), 

mandatory_courses_students as (
select s.student_id, s.major, t1.course_id
from students as s
cross join testing as t1
on s.major = t1.major
), 

electives_courses_students as (
select s.student_id, s.major, t2.course_id
from students as s
cross join testing2 as t2
on s.major = t2.major
), 

all_mandatory_notin as (
select distinct m1.student_id
from mandatory_courses_students as m1
left join testing3 as t3
on m1.student_id = t3.student_id and t3.mandatory = 'yes' and m1.course_id = t3.course_id
where t3.course_id is null or grade <> 'A'
order by m1.student_id
), 

atleast_two_in as (
select distinct e1.student_id
from electives_courses_students as e1
left join testing3 as t3
on e1.student_id = t3.student_id and t3.mandatory = 'no' and e1.course_id = t3.course_id
where t3.grade = 'A' or t3.grade = 'B'
group by e1.student_id
having count(distinct e1.course_id) >= 2
order by e1.student_id
)

select distinct t.student_id 
from (select *, avg(gpa) over (partition by student_id) as avg_gpa
from enrollments
where student_id not in (select student_id from all_mandatory_notin) and student_id in (select student_id from atleast_two_in)) as t
where t.avg_gpa >= 2.5
order by t.student_id asc
