# Write your MySQL query statement below

select distinct user_id
from loans
where user_id in (select user_id from loans where loan_type = 'Refinance') and user_id in (select user_id from loans where loan_type = 'Mortgage') 
order by user_id asc