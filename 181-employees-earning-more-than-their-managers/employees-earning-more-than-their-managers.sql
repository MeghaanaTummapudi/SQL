# Write your MySQL query statement below

-- with testing as (
-- select id, salary
-- from employee 
-- where id in (select distinct managerid 
-- from employee)
-- -- where managerid is not null)
-- )

-- select e.name as employee
-- from employee as e
-- left join testing as t
-- on e.managerid = t.id
-- where e.salary > t.salary

select e.name as employee
from employee as e
join employee as e1
on e.managerid = e1.id
where e.salary > e1.salary
