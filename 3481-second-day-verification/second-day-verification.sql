# Write your MySQL query statement below

select e.user_id
from emails as e
left join texts as t
on e.email_id = t.email_id
where t.signup_action = 'Verified' and datediff(t.action_date, e.signup_date) = 1
order by e.user_id asc