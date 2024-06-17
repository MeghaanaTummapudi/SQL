# Write your MySQL query statement below

with testing as (
select *, 
       dense_rank() over (partition by departmentId order by salary desc) as r
from employee 
)

select d.name as Department, t.name as Employee, t.salary as Salary
from testing as t
inner join department as d
on t.departmentId = d.id
where r <= 3