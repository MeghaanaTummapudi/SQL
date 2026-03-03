# Write your MySQL query statement below

-- select user_id, max(visit_date) as max_date
-- from uservisits 
-- group by user_id

-- select t.*, datediff(t.dr, t.visit_date)
-- from (select *, 
--        lead(visit_date) over (partition by user_id order by visit_date ) as dr
-- from uservisits ) as t



with testing as (
select *, 
       lead(visit_date) over (partition by user_id order by visit_date ) as dr
from uservisits
), 

t2 as (
select user_id, max(visit_date) as max_date
from uservisits 
group by user_id),


t3 as (
select tf.user_id, tf.visit_date,  (case when (tf.dr is null and visit_date = tmid.max_date) then '2021-1-1' else tf.dr end) as test1
from testing as tf
join t2 as tmid
on tf.user_id = tmid.user_id
)

select user_id, max(datediff(test1, visit_date)) as biggest_window
from t3
group by user_id
order by user_id