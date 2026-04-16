# Write your MySQL query statement below

with testing as (
select country_id, (case when avg(weather_state) <= 15 then 'Cold'
                        when avg(weather_state) >= 25 then 'Hot'
                   else 'Warm' end) as type
from weather
where year(day) = 2019 and month(day) = 11
group by country_id
)

select c.country_name, t.type as weather_type
from countries as c
join testing as t
on c.country_id = t.country_id