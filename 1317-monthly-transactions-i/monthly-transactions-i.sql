# Write your MySQL query statement below

select country, left(trans_date, 7) as month, count(*) as trans_count, sum(case when state = 'approved' then 1 else 0 end) as approved_count, sum(amount) as trans_total_amount, sum(case when state = 'approved' then amount else 0 end) as approved_total_amount
from transactions
group by country, month