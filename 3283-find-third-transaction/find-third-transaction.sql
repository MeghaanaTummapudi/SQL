# Write your MySQL query statement below

with testing as (
select *, row_number() over (partition by user_id order by transaction_date asc) as rn, 
    lag(spend, 1) over (partition by user_id order by transaction_date asc) as l1, 
    lag(spend, 2) over (partition by user_id order by transaction_date asc) as l2
from transactions
)

select user_id, spend as third_transaction_spend, transaction_date as  third_transaction_date 
from testing
where rn = 3 and spend > l1 and spend > l2
order by user_id

