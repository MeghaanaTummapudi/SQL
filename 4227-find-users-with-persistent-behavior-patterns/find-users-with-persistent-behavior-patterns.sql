# Write your MySQL query statement below

-- with testing as (
-- select *
-- from activity
-- where user_id not in (select user_id
--                       from activity
--                       group by user_id, action_date
--                       having count(distinct action) > 1)
-- )

with testing as (
select t.*, date_sub(t.action_date, interval t.r day) as ds
from (select *, 
       row_number() over (partition by user_id order by action_date asc) as r 
from activity) as t
),

testing2 as (
select *
from (select *, count(*) over (partition by user_id, ds, action) as n_c
from testing ) as t
where t.n_c >= 5
), 

testing3 as (
select *
from activity
where user_id not in (select user_id
                      from activity
                      group by user_id, action_date
                      having count(distinct action) > 1)
)

select user_id, action, n_c as streak_length, min(action_date) as start_date, max(action_date) as end_date
from testing2
where (user_id, action, n_c) in (select user_id, action, max(n_c) from testing2 group by user_id) and user_id in (select user_id from testing3)
group by user_id, action
order by streak_length desc, user_id asc

