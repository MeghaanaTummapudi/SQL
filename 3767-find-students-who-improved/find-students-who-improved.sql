# Write your MySQL query statement below

with testing as (
select *, 
       dense_rank() over(partition by student_id, subject order by exam_date asc) as dr
from scores
), 

testing2 as (
select student_id, subject, min(dr) as min_dr, max(dr) as max_dr
from testing
group by student_id, subject
)

select t1.student_id, t1.subject, t1.score as first_score, t2.score as latest_score
from testing as t1
join testing as t2
on t1.student_id = t2.student_id and t1.subject = t2.subject and t1.exam_date < t2.exam_date
join testing2 as t3
on t1.student_id = t3.student_id and t1.subject = t3.subject
where t2.score > t1.score and t1.dr = t3.min_dr and t2.dr = t3.max_dr
order by t1.student_id, t1.subject asc