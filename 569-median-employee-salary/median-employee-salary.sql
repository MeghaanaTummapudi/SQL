# Write your MySQL query statement below

with testing as (
select *, 
       row_number() over (partition by company order by salary asc) as r
from employee
),

testing2 as (
select company, count(*) as n_c
from employee
group by company
), 

testing3 as (
select t1.id, t1.company, t1.salary,
       (case when n_c % 2 = 0 then r = n_c / 2 or r = n_c / 2 + 1
            else r = ceil(n_c/2) end) as t
from testing2 as t2
join testing as t1
on t2.company = t1.company
)

select id, company, salary
from testing3
where t = 1

