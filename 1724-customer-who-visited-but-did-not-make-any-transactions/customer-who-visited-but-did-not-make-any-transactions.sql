# Write your MySQL query statement below

-- select v.customer_id as customer_id, count(v.customer_id) as count_no_trans
-- from Visits as v
-- left join Transactions as t
-- on v.visit_id = t.visit_id 
-- where t.transaction_id is NULL
-- group by v.customer_id

select v.customer_id, count(v.customer_id) as count_no_trans
from Visits as v
where v.visit_id not in (select t.visit_id from Transactions as t)
group by v.customer_id