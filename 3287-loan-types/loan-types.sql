# Write your MySQL query statement below

-- select distinct user_id
-- from loans
-- where user_id in (select user_id from loans where loan_type = 'Refinance') and user_id in (select user_id from loans where loan_type = 'Mortgage') 
-- order by user_id asc

select distinct user_id
from loans
group by user_id
having sum(if(loan_type = 'Refinance', 1, 0)) > 0 and sum(if(loan_type = 'Mortgage', 1, 0)) > 0
order by user_id asc