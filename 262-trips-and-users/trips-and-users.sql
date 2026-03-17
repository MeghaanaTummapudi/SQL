# Write your MySQL query statement below

-- with testing as (
-- select users_id
-- from users
-- where banned = 'Yes'
-- )

-- select request_at as 'Day', round(sum(case when status = 'cancelled_by_client' or status = 'cancelled_by_driver' then 1 else 0 end) / count(*), 2) as 'Cancellation Rate'
-- from trips 
-- where (request_at between "2013-10-01" and "2013-10-03" ) and client_id not in (select users_id from testing) and driver_id not in (select users_id from testing)
-- group by request_at

select t.request_at as 'Day', round(sum(case when t.status = 'cancelled_by_client' or t.status = 'cancelled_by_driver' then 1 else 0 end) / count(*), 2) as 'Cancellation Rate'
from trips as t
join users as u1
on t.client_id = u1.users_id
join users as u2
on t.driver_id = u2.users_id
where u1.banned = 'No' and u2.banned = 'No' and (t.request_at between "2013-10-01" and "2013-10-03")
group by t.request_at