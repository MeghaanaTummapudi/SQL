# Write your MySQL query statement below
select date_format(trans_date, '%Y-%m') as month, country, count(*) as trans_count, 
       count(case when state = 'approved' then 1 else null end) as approved_count, 
       sum(amount) as trans_total_amount,
       sum(case when state = 'approved' then amount else 0 end) as approved_total_amount
from Transactions
group by date_format(trans_date, '%Y-%m'), country
order by month(trans_date) desc
# DATE_FORMAT(<your-date>, '%Y-%m %M')