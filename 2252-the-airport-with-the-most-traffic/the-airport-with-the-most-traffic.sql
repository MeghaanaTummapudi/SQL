# Write your MySQL query statement below

with testing as (
select departure_airport as id, flights_count as n_c
from flights

union all

select arrival_airport as id, flights_count as n_c
from flights
)

select t.id as airport_id
from (select id, dense_rank() over (order by sum(n_c) desc) as dr
from testing
group by id) as t
where t.dr = 1
