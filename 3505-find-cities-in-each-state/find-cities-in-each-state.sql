# Write your MySQL query statement below

select state, group_concat(distinct city order by city asc separator ', ') as cities
from cities
group by state
order by state asc, cities asc