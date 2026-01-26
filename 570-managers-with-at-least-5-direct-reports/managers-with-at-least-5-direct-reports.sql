# Write your MySQL query statement below

with testing as (
select managerid, count(managerid) as n_c
from employee as e1
where managerid is not null
group by managerid
)

select e.name
from testing as t
join employee as e
on t.managerid = e.id
where t.n_c >= 5
