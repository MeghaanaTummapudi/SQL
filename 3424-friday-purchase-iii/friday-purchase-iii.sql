# Write your MySQL query statement below

with testing as (
select *, (WEEK(purchase_date) - WEEK(DATE_SUB(purchase_date, INTERVAL DAYOFMONTH(purchase_date) - 1 DAY)) + 1)  as weeks
from purchases
where month(purchase_date) = 11 and year(purchase_date) = 2023 and dayofweek(purchase_date) = 6
), 

testing2 as (
select *
from users
where membership <> 'Standard'
), 

memberships as (
select 'Premium' as membership

union all 

select 'VIP' as membership
), 

weeks as (

select 1 as w

union all

select 2 as w

union all

select 3 as w

union all

select 4 as w
), 

testing4 as (
select t2.membership, t1.weeks, sum(t1.amount_spend) as tot
from testing2 as t2
join testing as t1
on t2.user_id = t1.user_id
group by membership, weeks

)

select w1.w as week_of_month, m1.membership as membership, ifnull(t4.tot, 0) as total_amount
from weeks as w1
cross join memberships as m1
left join testing4 as t4
on w1.w = t4.weeks and m1.membership = t4.membership
order by w1.w asc, m1.membership asc