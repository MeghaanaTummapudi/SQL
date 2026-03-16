# Write your MySQL query statement below

-- select id, name
-- from students
-- where department_id in (select s.department_id
-- from students as s
-- left join departments as d
-- on s.department_id = d.id
-- where d.id is null)


with testing as (
select s.department_id
from students as s
left join departments as d
on s.department_id = d.id
where d.id is null
)

select id, name
from students
where department_id in (select department_id from testing)