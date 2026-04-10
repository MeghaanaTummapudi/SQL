# Write your MySQL query statement below

with testing as (
select *, 
       avg(occurrences) over (partition by event_type) as av
from events
)

-- select distinct business_id
-- from testing
-- group by business_id
-- having sum(case when occurrences > av then 1 else 0 end) >= 2

select distinct business_id
from testing
where occurrences > av
group by business_id
having count(*) >= 2