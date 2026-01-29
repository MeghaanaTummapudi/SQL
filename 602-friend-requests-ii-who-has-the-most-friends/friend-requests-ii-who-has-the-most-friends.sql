# Write your MySQL query statement below

with testing as (
select requester_id as id, count(*) as n_c
from requestaccepted
where accept_date is not null
group by requester_id


union all

select accepter_id as id, count(*) as n_c2
from requestaccepted
where accept_date is not null
group by accepter_id
), 

testing2 as (
select id, sum(n_c) as nc_count
from testing
group by id
)

select id, nc_count as num
from testing2 
where nc_count in (select max(nc_count) from testing2)

