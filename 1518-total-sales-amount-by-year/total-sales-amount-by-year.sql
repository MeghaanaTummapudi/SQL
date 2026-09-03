# Write your MySQL query statement below

with all_years as (
select '2018-01-01' as start_yr, '2018-12-31' as end_yr
union all
select '2019-01-01' as start_yr, '2019-12-31' as end_yr
union all
select '2020-01-01' as start_yr, '2020-12-31' as end_yr
), 

testing2 as (
select *, (case when year(s.period_start) = year(s.period_end) then datediff(s.period_end, s.period_start) + 1
                when year(s.period_start) <> year(s.period_end) and s.period_start > a.start_yr then datediff(a.end_yr, s.period_start) + 1
                when year(s.period_start) <> year(s.period_end) and s.period_start < a.start_yr and s.period_end < a.end_yr and s.period_end >= a.start_yr then datediff(s.period_end, a.start_yr) + 1
               else datediff(a.end_yr, a.start_yr) + 1 end) as ty
from sales as s
cross join all_years as a
where s.period_start <= a.end_yr and s.period_end >= a.start_yr
order by s.product_id
)

select t2.product_id, p.product_name, cast(year(t2.start_yr) as char) as report_year, (t2.average_daily_sales * t2.ty) as total_amount
from testing2 as t2
left join product as p
on t2.product_id = p.product_id
order by t2.product_id asc, t2.start_yr asc