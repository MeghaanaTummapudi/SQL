# Write your MySQL query statement below

select name
from Employee
where id in (select distinct managerId 
            from Employee 
            group by managerId
            having count(managerId) >= 5)