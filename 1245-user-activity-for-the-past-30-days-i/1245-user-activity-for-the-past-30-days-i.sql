# Write your MySQL query statement below

select activity_date as day, count(distinct user_id) as active_users
from Activity
where (activity_date between '2019-06-28' and '2019-07-27') and activity_type is not null
-- where datediff('2019-07-27', activity_date) < 30 and datediff('2019-07-27', activity_date) >= 0 and activity_type is not null
group by activity_date

