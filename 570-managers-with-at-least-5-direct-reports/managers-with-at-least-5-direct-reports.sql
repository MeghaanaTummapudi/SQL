# Write your MySQL query statement below

with testing as (
select distinct managerId
from employee
group by managerId
having count(managerId) >= 5
)

select name
from employee
where id in (select * from testing)