# Write your MySQL query statement below

with testing as (
select user_id, min(event_date) as mi, max(event_date) as ma, max(monthly_amount) as max_amt
from subscription_events
group by user_id
), 

active_users as (
select distinct user_id
from subscription_events
where user_id not in (select user_id
from subscription_events
where event_type = 'cancel' and (user_id, event_date) in (select user_id, ma from testing))
), 

downgrade as (
select distinct user_id
from subscription_events
where event_type = 'downgrade'
), 

revenue as (
select s.user_id
from testing as t
left join subscription_events as s
on t.user_id = s.user_id and t.ma = s.event_date
where s.monthly_amount < 0.5 * t.max_amt
), 

time_period as ( 
select user_id, datediff(ma, mi) as subs_time
from testing
where datediff(ma, mi) >= 60
)

select s.user_id, s.plan_name as current_plan, s.monthly_amount as current_monthly_amount, t2.max_amt as max_historical_amount, t.subs_time as days_as_subscriber
from subscription_events as s
join active_users as a
on s.user_id = a.user_id
join downgrade as d
on s.user_id = d.user_id
join revenue as r
on s.user_id = r.user_id
join time_period as t
on s.user_id = t.user_id
join testing as t2
on  s.user_id = t2.user_id
where s.event_date = t2.ma
order by days_as_subscriber desc, s.user_id asc



