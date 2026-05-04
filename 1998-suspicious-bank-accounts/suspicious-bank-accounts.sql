# Write your MySQL query statement below

-- with testing as (
-- select t.account_id, date_format(t.day, '%Y-%m') as mon, sum(t.fin_amt) as tot
-- from (select *, (case when type = 'Creditor' then amount else (-1 * amount) end) as fin_amt
-- from transactions) as t
-- group by t.account_id, date_format(t.day, '%Y-%m')
-- )

-- select *
-- from accounts as a
-- left join testing as t
-- on a.account_id = t.account_id
-- where t.tot > 
-- order by a.account_id

with testing as (
select account_id, date_format(day, '%Y-%m') as dt, sum(amount) as tot
from transactions 
where type = 'creditor'
group by account_id, date_format(day, '%Y-%m')
order by account_id
), 

testing2 as (
select t.account_id, t.dt, t.tot
from testing as t
left join accounts as a
on t.account_id = a.account_id
where t.tot > a.max_income
)

select distinct t2.account_id
from (select *, lead(dt, 1) over (partition by account_id order by dt asc) as dt2
from testing2) as t2
where (right(t2.dt2, 2) - right(t2.dt, 2)) = 1 or period_diff(replace(t2.dt2, '-', ''), replace(t2.dt, '-', '')) = 1
-- distinct t2.account_id
