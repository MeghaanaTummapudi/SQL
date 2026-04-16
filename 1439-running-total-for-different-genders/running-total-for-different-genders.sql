# Write your MySQL query statement below

select gender, day, 
       sum(score_points) over (partition by gender order by day asc) as total
from scores
order by gender, day asc