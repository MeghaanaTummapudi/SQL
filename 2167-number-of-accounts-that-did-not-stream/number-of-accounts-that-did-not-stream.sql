# Write your MySQL query statement below

with testing as (
select distinct account_id
from streams
where year(stream_date) <> 2021
)

-- select count(distinct t.account_id) as accounts_count
-- from subscriptions as s
-- left join testing as t
-- on s.account_id = t.account_id
-- where (year(start_date) = 2021 or year(end_date) = 2021) and t.account_id is not null

select count(distinct account_id) as accounts_count
from subscriptions
where account_id in (select account_id from testing) and ((year(start_date) = 2021 or year(end_date) = 2021))