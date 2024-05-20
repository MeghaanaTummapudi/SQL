# Write your MySQL query statement below
/*with testing as (
select id, recordDate, temperature,
       lead(id, 1) over (order by recordDate asc) as tid,
       lead(recordDate, 1) over (order by recordDate asc) as t1,
       lead(temperature, 1) over (order by recordDate asc) as t2
from weather
)

select tid as Id
from testing
where datediff(t1, recordDate) = 1 and recordDate < t1 and temperature < t2
*/

select w2.id as Id
from weather as w1
inner join weather as w2
on w1.recordDate < w2.recordDate and w1.temperature < w2.temperature and datediff(w2.recordDate, w1.recordDate) = 1