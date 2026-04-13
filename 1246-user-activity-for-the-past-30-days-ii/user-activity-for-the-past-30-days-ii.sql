# Write your MySQL query statement below

-- 2019-06-27
select ifnull(round(avg(t.sc), 2), 0) as average_sessions_per_user
from (select user_id, count(distinct session_id) as sc
from activity
where (activity_date between '2019-06-28' and '2019-07-27') and activity_type is not null
group by user_id
having count(activity_type) >= 1
) as t
