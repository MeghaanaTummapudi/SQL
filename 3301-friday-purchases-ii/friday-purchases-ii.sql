# Write your MySQL query statement below

-- select *, WEEK(purchase_date, 0) - WEEK(DATE_SUB(purchase_date, INTERVAL DAYOFMONTH(purchase_date) - 1 DAY), 0) + 1  as week_of_month
-- from purchases


with recursive cte as (

select '2023-11-01' as start

union all

select date_add(start, interval 1 day)
from cte
where start < '2023-11-30'
), 

testing as (
select start as fri_dates, (WEEK(start, 0) - WEEK(DATE_SUB(start, INTERVAL DAYOFMONTH(start) - 1 DAY), 0) + 1) as week_of_month
from cte
where dayname(start) = 'Friday'
)

select t.week_of_month, t.fri_dates as purchase_date, ifnull(sum(p.amount_spend), 0) as total_amount
from testing as t
left join purchases as p
on t.fri_dates = p.purchase_date
group by t.fri_dates
order by t.week_of_month asc