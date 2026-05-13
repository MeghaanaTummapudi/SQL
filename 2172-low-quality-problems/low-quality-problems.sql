# Write your MySQL query statement below

select t.problem_id
from (select *, ((likes * 100) / (likes + dislikes)) as perc
from problems) as t
where t.perc < 60
order by t.problem_id asc