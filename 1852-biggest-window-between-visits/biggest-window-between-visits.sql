# Write your MySQL query statement below

-- with testing as (
-- select *, 
--        lead(visit_date) over (partition by user_id order by visit_date ) as dr
-- from uservisits
-- ), 

-- t2 as (
-- select user_id, max(visit_date) as max_date
-- from uservisits 
-- group by user_id),


-- t3 as (
-- select tf.user_id, tf.visit_date,  (case when (tf.dr is null and visit_date = tmid.max_date) then '2021-1-1' else tf.dr end) as test1
-- from testing as tf
-- join t2 as tmid
-- on tf.user_id = tmid.user_id
-- )

-- select user_id, max(datediff(test1, visit_date)) as biggest_window
-- from t3
-- group by user_id
-- order by user_id

with testing as (
select *, 
       lead(visit_date) over (partition by user_id order by visit_date) as test
from uservisits as u1
), 

t2 as (
select user_id, visit_date, 
       (case when test is null then '2021-1-1' else test end) as f2
from testing
)

select user_id, max(datediff(f2, visit_date)) as biggest_window
from t2
group by user_id
order by user_id
