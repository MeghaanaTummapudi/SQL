# Write your MySQL query statement below

with testing as (
select question_id, (sum(action = 'answer') / sum(action = 'show')) as a_rate
from surveylog
where action = 'answer' or action = 'show'
group by question_id
)

select question_id as survey_log
from testing
where a_rate in (select max(a_rate) from testing)
order by question_id asc
limit 1