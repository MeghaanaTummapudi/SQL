# Write your MySQL query statement below

-- select activity_date as day, count(distinct user_id) as active_users
-- from activity
-- where datediff('2019-07-27', activity_date) < 30 and datediff('2019-07-27', activity_date) >=0  and activity_type is not null
-- group by activity_date
-- having active_users <> 0


-- end_date = '2019-07-27'
-- diff = 30
-- start_date = '2019-06-27'

select activity_date as day, count(distinct user_id) as active_users
from activity
where (activity_date between '2019-06-28' and '2019-07-27') and activity_type is not null
group by activity_date
having active_users <> 0
