# Write your MySQL query statement below

-- select t.request_at as 'Day', round(sum(case when t.status = 'cancelled_by_client' or t.status = 'cancelled_by_driver' then 1 else 0 end) / count(*), 2) as 'Cancellation Rate'
-- from trips as t
-- join users as u
-- on u.users_id = t.client_id 
-- where (t.request_at between "2013-10-01" and "2013-10-03" ) and u.banned = 'No'
-- group by t.request_at
-- having count(request_at) >= 1

with testing as (
select users_id
from users
where banned = 'Yes'
)

select request_at as 'Day', round(sum(case when status = 'cancelled_by_client' or status = 'cancelled_by_driver' then 1 else 0 end) / count(*), 2) as 'Cancellation Rate'
from trips 
where client_id not in (select users_id from testing) and driver_id not in (select users_id from testing) and (request_at between "2013-10-01" and "2013-10-03" )
group by request_at