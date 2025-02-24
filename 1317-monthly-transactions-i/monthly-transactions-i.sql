# Write your MySQL query statement below

select left(trans_date, 7) as month, country, count(*) as trans_count, 
       count(case when state = 'approved' then 1 else null end) as approved_count,
       sum(amount) as trans_total_amount, 
       sum(case when state = 'approved' then amount else 0 end) as approved_total_amount
from Transactions 
group by left(trans_date, 7), country

-- select left(trans_date, 7) as t
-- from Transactions