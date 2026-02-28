# Write your MySQL query statement below

select t.transaction_id
from (select *, 
       dense_rank () over (partition by day order by amount desc) as dr
    from transactions) as t
where t.dr = 1
order by t.transaction_id asc


-- select t1.transaction_id
-- from transactions as t1
-- where amount = (select max(amount)
--                 from transactions as t2
--                 where t1.day = t2.day)
-- order by t1.transaction_id


