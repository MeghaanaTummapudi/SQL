# Write your MySQL query statement below

with man_id as (
select managerid
from employee
where managerid is not null 
group by managerid
having count(*) >= 5
)

-- select name
-- from employee
-- where id in (select managerid from man_id)

select e.name as name
from man_id  as m
inner join employee as e
on m.managerid = e.id
