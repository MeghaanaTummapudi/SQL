# Write your MySQL query statement below
with testing as (
    select v.visit_id, v.customer_id, t.transaction_id, t.amount
    from visits as v
    left join transactions as t
    on v.visit_id = t.visit_id
)
select distinct customer_id, count(*) as count_no_trans
from testing
where transaction_id is null
group by customer_id

