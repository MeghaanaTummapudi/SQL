# Write your MySQL query statement below

with testing as (
select *, 
       row_number() over (partition by username order by startdate desc) as rn
from useractivity
)

select username, activity, startdate, enddate
from testing 
where rn = 2 or username in (select username from testing group by username having count(*) = 1)

