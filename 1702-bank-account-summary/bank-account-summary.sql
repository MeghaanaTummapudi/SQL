# Write your MySQL query statement below

-- with testing as (
-- select paid_by as p1, (-1 * amount) as s1
-- from transactions

-- union all

-- select paid_to as p1, amount as s1
-- from transactions
-- ), 

-- testing2 as (
-- select p1, sum(s1) as tst
-- from testing
-- group by p1
-- )

-- select u.user_id, u.user_name, (u.credit + ifnull(t2.tst, 0)) as credit, 
--        (case when (u.credit + ifnull(t2.tst, 0)) < 0 then 'Yes' else 'No' end) as credit_limit_breached
-- from users as u
-- left join testing2 as t2
-- on u.user_id = t2.p1



with testing as (
select paid_by, sum(amount) as out_cash
from transactions
group by paid_by
),

testing2 as (
select paid_to, sum(amount) as in_cash
from transactions
group by paid_to
)

select u.user_id, u.user_name, (u.credit + ifnull(t2.in_cash, 0) - ifnull(t1.out_cash, 0)) as credit, 
       (case when (u.credit + ifnull(t2.in_cash, 0) - ifnull(t1.out_cash, 0)) < 0 then 'Yes' else 'No' end) as credit_limit_breached
from users as u
left join testing as t1
on u.user_id = t1.paid_by
left join testing2 as t2
on u.user_id = t2.paid_to