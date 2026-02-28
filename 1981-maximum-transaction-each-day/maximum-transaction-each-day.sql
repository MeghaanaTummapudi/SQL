# Write your MySQL query statement below

select t.transaction_id
from (select *, 
       dense_rank () over (partition by day order by amount desc) as dr
    from transactions) as t
where t.dr = 1
order by t.transaction_id asc


