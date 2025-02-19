# Write your MySQL query statement below

-- select name
-- from Employee
-- where id in (select distinct managerId 
--             from Employee 
--             group by managerId
--             having count(managerId) >= 5)

with testing as 
( select distinct managerId as m_id 
from Employee 
group by managerId
having count(managerId) >= 5
)

select e.name
from testing as t
left join employee as e
on t.m_id = e.id 
where  e.id is not null