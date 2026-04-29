# Write your MySQL query statement below

with testing as (
select *, 
       row_number() over (partition by experience order by salary asc) as dr
from candidates
),

testing2 as (
select *, 
       sum(salary) over (partition by experience order by dr asc) as min_sal, (case when experience = 'Senior' then 70000 else 0 end) as sr_base
from testing
),

testing3 as (
select count(*) as sr_count, min(sr_base - min_sal) as jr_base
from testing2
where experience = 'Senior' and (sr_base - min_sal) > 0
),

testing4 as (
select count(t.employee_id) as jr_count
from (select *, ((select ifnull(jr_base, 70000) from testing3) - min_sal)   as tst
      from testing2 
    where experience = 'Junior' ) as t
where t.tst > 0
), 

testing6 as (
select 'Junior' as experience

union all

select 'Senior' as experience
)

select *, (case when experience = 'Junior' then (select jr_count from testing4)
               when experience = 'Senior' then (select sr_count from testing3) else null end) as accepted_candidates
from testing6 
