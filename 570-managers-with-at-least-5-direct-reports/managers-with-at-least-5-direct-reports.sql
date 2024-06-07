# Write your MySQL query statement below

with man_id as (
select managerid
from employee
where managerid is not null 
group by managerid
having count(*) >= 5
)

select name
from employee
where id in (select managerid from man_id)
