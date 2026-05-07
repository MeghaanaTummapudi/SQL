# Write your MySQL query statement below

select distinct c1.user_id
from confirmations as c1
left join confirmations as c2
on c1.user_id = c2.user_id and c1.time_stamp < c2.time_stamp and c1.action is not null and c2.action is not null
where c2.user_id is not null and timestampdiff(second, c1.time_stamp, c2.time_stamp) <= 86400