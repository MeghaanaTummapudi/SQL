# Write your MySQL query statement below

-- activity_date as day, count(distinct user_id) as active_users
select activity_date as day, count(distinct user_id) as active_users
from activity
where datediff('2019-07-27', activity_date) < 30 and datediff('2019-07-27', activity_date) >=0  and activity_type is not null
group by activity_date
having active_users <> 0