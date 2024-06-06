# Write your MySQL query statement below

-- select w1.id as id
-- from weather as w1
-- left join weather w2
-- on w1.recorddate > w2.recorddate and datediff(w1.recorddate, w2.recorddate) = 1
-- where w1.temperature > w2.temperature
-- order by w1.recorddate asc

with testing as (
select id, recorddate, temperature,       
        LAG(recorddate) OVER (ORDER BY recorddate ASC) AS lag_t,
        LAG(temperature) OVER (ORDER BY recorddate ASC) AS lag_temp
from weather 

)

select  id
from testing
-- where temperature > previousTemp and DATEDIFF(recordDate, previousDate) =1
where temperature > lag_temp and datediff(recorddate, lag_t) = 1


# Write your MySQL query statement below
-- With test As (
--     SELECT *, LAG(temperature) over (ORDER by recordDate) as previousTemp,
--     LAG(recordDate) OVER (ORDER BY recordDate) as previousDate 
--     from Weather
-- ) 

-- Select id from test where temperature > previousTemp and DATEDIFF(recordDate, previousDate) =1

/*SELECT w1.id FROM Weather w1, Weather w2
where  DATEDIFF( w2.recordDate,w1.recordDate) = 1 and w1.temperature > w2.temperature*/
