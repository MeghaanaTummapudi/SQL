# Write your MySQL query statement below

with testing as (
select *, row_number() over (partition by s.school_id order by e.student_count, e.score desc) as rn
from schools as s
cross join exam as e
on s.capacity >= e.student_count
order by s.school_id
),

testing2 as (
select school_id, score
from testing
where (school_id, rn) in (select school_id, max(rn) from testing group by school_id)
)

select s.school_id, ifnull(t2.score, -1) as score
from schools as s
left join testing2 as t2
on s.school_id = t2.school_id
order by s.school_id, t2.score 

-- select *
-- from testing