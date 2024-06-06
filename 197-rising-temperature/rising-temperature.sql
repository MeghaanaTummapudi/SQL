# Write your MySQL query statement below

select w1.id as id
from weather as w1
left join weather w2
on w1.recorddate > w2.recorddate and datediff(w1.recorddate, w2.recorddate) = 1
where w1.temperature > w2.temperature
order by w1.recorddate asc