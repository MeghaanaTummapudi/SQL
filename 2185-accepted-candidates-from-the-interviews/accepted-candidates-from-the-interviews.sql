# Write your MySQL query statement below

select distinct t.candidate_id
from (select c.candidate_id, c. years_of_exp, sum(r.score) over (partition by r.interview_id) as avs
from candidates as c
left join Rounds as r
on c.interview_id = r.interview_id) as t
where t.years_of_exp >= 2 and t.avs > 15

