# Write your MySQL query statement below

with testing as (
select paid_by as p1, (-1 * amount) as s1
from transactions

union all

select paid_to as p1, amount as s1
from transactions
), 

testing2 as (
select p1, sum(s1) as tst
from testing
group by p1
)

select u.user_id, u.user_name, (u.credit + ifnull(t2.tst, 0)) as credit, 
       (case when (u.credit + ifnull(t2.tst, 0)) < 0 then 'Yes' else 'No' end) as credit_limit_breached
from users as u
left join testing2 as t2
on u.user_id = t2.p1




