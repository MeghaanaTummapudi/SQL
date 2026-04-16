# Write your MySQL query statement below

-- select gender, day, 
--        sum(score_points) over (partition by gender order by day asc) as total
-- from scores
-- order by gender, day asc

select s1.gender, s1.day, sum(s2.score_points) as total
from scores as s1
left join scores as s2
on s1.gender = s2.gender and s1.day >= s2.day
group by s1.gender, s1.day
order by s1.gender, s1.day