# Write your MySQL query statement below

with testing as (
select *, 
       dense_rank() over (partition by exam_id order by score desc) as dr_highscore,
       dense_rank() over (partition by exam_id order by score asc) as dr_lowscore
from exam
),

t2 as (
select distinct student_id
from testing
where dr_highscore in (select min(dr_highscore) from testing) or dr_lowscore in (select min(dr_lowscore) from testing)
)

select distinct e.student_id, s.student_name
from exam as e
left join student as s
on e.student_id = s.student_id
left join t2 as t2
on t2.student_id = e.student_id
where t2.student_id is null
order by e.student_id





#### new sol - using union all

-- with testing as (
-- select distinct t.student_id
-- from (select *, 
--        dense_rank() over (partition by exam_id order by score desc) as dr
--     from exam ) as t
-- where t.dr = 1

-- union all 

-- select distinct t2.student_id
-- from (select *,
--        dense_rank() over (partition by exam_id order by score asc) as dr2
--      from exam) as t2
-- where t2.dr2 = 1

-- )

-- select distinct e.student_id, s.student_name
-- from exam as e
-- left join student as s
-- on e.student_id = s.student_id
-- left join testing as tinfi
-- on tinfi.student_id = e.student_id
-- where tinfi.student_id is null
-- order by e.student_id
