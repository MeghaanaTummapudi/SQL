# Write your MySQL query statement below

with testing as (
select *, 
       row_number() over(partition by student_id, subject order by exam_date asc) as minr, 
       row_number() over(partition by student_id, subject order by exam_date desc) as maxr
from scores
)

select t1.student_id, t1.subject, t1.score as first_score, t2.score as latest_score
from testing as t1
join testing as t2
on t1.student_id = t2.student_id and t1.subject = t2.subject and t1.exam_date < t2.exam_date
where t2.score > t1.score and t1.minr = 1 and t2.maxr = 1
order by t1.student_id, t1.subject asc








-- select s1.student_id, s1.subject, s1.score as first_score , s2.score as latest_score 
-- from scores as s1
-- join scores as s2
-- on s1.student_id = s2.student_id and s1.subject = s2.subject and s1.exam_date < s2.exam_date
-- where s2.score > s1.score and (s2.student_id, s2.subject, s2.exam_date) in (select student_id, subject, max(exam_date) from scores group by student_id, subject) and (s1.student_id, s1.subject, s1.exam_date) in (select student_id, subject, min(exam_date) from scores group by student_id, subject)
-- order by s1.student_id, s1.subject asc


-- with testing as (
-- select *, 
--        dense_rank() over(partition by student_id, subject order by exam_date asc) as dr
-- from scores
-- ), 

-- testing2 as (
-- select student_id, subject, min(dr) as min_dr, max(dr) as max_dr
-- from testing
-- group by student_id, subject
-- )

-- select t1.student_id, t1.subject, t1.score as first_score, t2.score as latest_score
-- from testing as t1
-- join testing as t2
-- on t1.student_id = t2.student_id and t1.subject = t2.subject and t1.exam_date < t2.exam_date
-- join testing2 as t3
-- on t1.student_id = t3.student_id and t1.subject = t3.subject
-- where t2.score > t1.score and t1.dr = t3.min_dr and t2.dr = t3.max_dr
-- order by t1.student_id, t1.subject asc