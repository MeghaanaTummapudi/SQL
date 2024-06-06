# Write your MySQL query statement below

# not in statement
select v.customer_id, count(v.customer_id) as count_no_trans
from visits as v
where v.visit_id not in (select visit_id from transactions)
group by v.customer_id

# left join with nulls (anti join hasnt happened)
-- select v.customer_id, count(*) as count_no_trans
-- from visits as v
-- left join transactions as t
-- on v.visit_id = t.visit_id
-- where t.transaction_id is null
-- group by v.customer_id