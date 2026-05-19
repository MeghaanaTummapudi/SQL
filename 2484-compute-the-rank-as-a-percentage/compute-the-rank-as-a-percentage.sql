# Write your MySQL query statement below

with testing as (
select *, 
      cast(rank() over (partition by department_id order by mark desc) as signed) as dr, 
      count(*) over (partition by department_id) as n_c
from students
)

select student_id, department_id, ifnull(round(((dr - 1) * 100) / (n_c - 1), 2), 0) as percentage
from testing

-- select *
-- from testing