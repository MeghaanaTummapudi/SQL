# Write your MySQL query statement below

select t.score, t.r as 'rank'
from (select *, 
       dense_rank() over (order by score desc) as r
from scores) as t
order by t.score desc

