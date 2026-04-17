# Write your MySQL query statement below

-- with recursive cte as (
--     select 0 as n
    
--     union all

--     select n+1 
--     from cte
--     where n < (
--                select max(t.cnt)
--                from (select user_id, count(transaction_date) as cnt
--                from transactions
--                group by user_id) as t
--               )
-- ),

-- testing2 as (
-- select t1.cnt, count(t1.cnt) as tot
-- from (select v.user_id, v.visit_date, count(t.user_id) as cnt
-- from visits as v
-- left join transactions as t
-- on v.user_id = t.user_id and v.visit_date = t.transaction_date
-- group by v.user_id, v.visit_date) as t1
-- group by t1.cnt
-- )

-- select c.n as transactions_count, ifnull(tot, 0) as visits_count
-- from cte as c
-- left join testing2 as t2
-- on c.n = t2.cnt
-- order by transactions_count

-- select max(t.ct)
-- from (select v.user_id, v.visit_date, count(t.user_id) as ct
-- from visits as v
-- left join transactions as t
-- on v.user_id = t.user_id and v.visit_date = t.transaction_date
-- group by v.user_id, v.visit_date) as t


with recursive cte as (
    select 0 as n
    
    union all

    select n+1 
    from cte
    where n < (
               select max(tst.ct)
               from (select v.user_id, v.visit_date, count(t.user_id) as ct
                     from visits as v
                     left join transactions as t
                     on v.user_id = t.user_id and v.visit_date = t.transaction_date
                     group by v.user_id, v.visit_date) as tst

              )
),

testing2 as (
select t1.cnt, count(t1.cnt) as tot
from (select v.user_id, v.visit_date, count(t.user_id) as cnt
from visits as v
left join transactions as t
on v.user_id = t.user_id and v.visit_date = t.transaction_date
group by v.user_id, v.visit_date) as t1
group by t1.cnt
)

select c.n as transactions_count, ifnull(tot, 0) as visits_count
from cte as c
left join testing2 as t2
on c.n = t2.cnt
order by transactions_count
