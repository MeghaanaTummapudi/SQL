# Write your MySQL query statement below

select t.dname as department, t.name as employee, t.salary as salary
from (select e.name, d.name as dname,  e.salary, e.departmentid, 
       dense_rank () over(partition by e.departmentid order by e.salary desc) as dr
from employee as e
join department as d
on e.departmentid = d.id) as t
where t.dr = 1
