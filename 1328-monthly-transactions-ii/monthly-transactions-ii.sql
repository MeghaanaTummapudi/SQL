# Write your MySQL query statement below

with app as (
select date_format(trans_date, '%Y-%m') as mnt, country, sum(if(state = 'approved', 1, 0)) as approved_count, sum(if(state = 'approved', amount, 0)) as approved_amount
from transactions
group by date_format(trans_date, '%Y-%m'), country
), 

charge as (
select date_format(c.trans_date, '%Y-%m') as mnt, t.country, count(*) as chargeback_count, sum(amount) as chargeback_amount
from chargebacks as c
left join transactions as t
on c.trans_id = t.id
group by date_format(c.trans_date, '%Y-%m'), t.country
), 

testing3 as (
select a.mnt, a.country, a.approved_count, a.approved_amount, ifnull(c.chargeback_count, 0) as chargeback_count, ifnull(c.chargeback_amount, 0) as chargeback_amount
from app as a
left join charge as c
on a.mnt = c.mnt and a.country = c.country

union 

select c.mnt, c.country, ifnull(a.approved_count, 0) as approved_count, ifnull(a.approved_amount, 0) as approved_amount, c.chargeback_count, c.chargeback_amount
from charge as c
left join app as a
on a.mnt = c.mnt and a.country = c.country
)

select mnt as month, country, approved_count, approved_amount, chargeback_count, chargeback_amount
from testing3
where (approved_count <> 0) or (approved_amount <> 0) or (chargeback_count <> 0) or (chargeback_amount <> 0)