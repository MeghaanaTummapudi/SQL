# Write your MySQL query statement below

select DATE_FORMAT(trans_date, '%Y-%m') AS month, country, count(*) as trans_count, 
       count(case when state = 'approved' then 1 else null end) as approved_count,
       sum(amount) as trans_total_amount, 
       sum(case when state = 'approved' then amount else 0 end) as approved_total_amount
from Transactions 
group by month, country

-- SELECT 
--     LEFT(trans_date, 7) AS month,
--     country, 
--     COUNT(id) AS trans_count,
--     sum(state = 'approved') AS approved_count,
--     SUM(amount) AS trans_total_amount,
--     SUM((state = 'approved') * amount) AS approved_total_amount
-- FROM 
--     Transactions
-- GROUP BY 
--     month, country