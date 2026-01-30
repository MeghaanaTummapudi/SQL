# Write your MySQL query statement below

select d.name as department, t.name as employee, t.salary as salary
from (select *, 
       dense_rank () over (partition by departmentid order by salary desc) as dr
      from employee) as t
join department as d
on t.departmentid = d.id
where t.dr <= 3
    
