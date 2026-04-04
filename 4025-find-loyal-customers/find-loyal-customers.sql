# Write your MySQL query statement below

-- with testing as (
-- select customer_id, count(*) as totn_c, min(transaction_date) as start, max(transaction_date) as end
-- from customer_transactions
-- group by customer_id
-- )


-- select customer_id, transaction_type, count(transaction_type) as pn_c
-- from customer_transactions
-- group by customer_id, transaction_type


-- select customer_id, transaction_type, count(transaction_type) as pn_c
-- from customer_transactions
-- where transaction_type = 'purchase'
-- group by customer_id
-- having pn_c >= 3



with testing as (
select customer_id, min(transaction_date) as start, max(transaction_date) as end, sum(case when transaction_type = 'purchase' then 1 else 0 end) as purchase, sum(case when transaction_type = 'refund' then 1 else 0 end) as refund, count(*) as totn_c
from customer_transactions
group by customer_id
)


select customer_id
from testing
where purchase >= 3 and (refund / totn_c) < 0.2 and datediff(end, start) >= 30
order by customer_id asc
