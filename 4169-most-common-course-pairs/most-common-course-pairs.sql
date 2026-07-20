# Write your MySQL query statement below

with top_studs as (
select user_id
from course_completions
group by user_id
having count(course_name) >= 5 and avg(course_rating) >= 4
), 

sequence as (
select user_id, course_name as l1, lead(course_name) over (partition by user_id order by completion_date asc) as l2
from course_completions
where user_id in (select user_id from top_studs)
order by user_id
)

select l1 as first_course, l2 as second_course, count(*) as transition_count
from sequence
where l1 is not null and l2 is not null
group by l1, l2
order by transition_count desc, l1 asc, l2 asc