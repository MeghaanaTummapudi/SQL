# Write your MySQL query statement below

with testing as (
select *, 
       row_number() over (partition by continent order by name asc) as r
from student
)

select  
       max(case when continent = 'America' then name else null end) as America,
       max(case when continent = 'Asia' then name else null end) as Asia,
       max(case when continent = 'Europe' then name else null end) as Europe
from testing
group by r