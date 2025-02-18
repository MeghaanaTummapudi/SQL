# Write your MySQL query statement below

select w2.id as id
from Weather as w1
inner join Weather as w2
on w1.recordDate < w2.recordDate and w1.temperature < w2.temperature and datediff(w2.recordDate, w1.recordDate) = 1