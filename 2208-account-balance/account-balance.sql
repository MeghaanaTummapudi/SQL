# Write your MySQL query statement below

with testing as (
select *, 
       (case when type = 'Deposit' then amount else (-amount) end) as tp
from transactions
)

select account_id, day, 
       sum(tp) over (partition by account_id order by day asc) as balance
from testing
order by account_id, day asc