# Write your MySQL query statement below
with testing as (
select id, recordDate, temperature,
       lead(id, 1) over (order by recordDate asc) as tid,
       lead(recordDate, 1) over (order by recordDate asc) as t1,
       lead(temperature, 1) over (order by recordDate asc) as t2
from weather
)

select tid as Id
from testing
where datediff(t1, recordDate) = 1 and recordDate < t1 and temperature < t2
-- where recordDate < t1 and temperature < t2
