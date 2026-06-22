# Write your MySQL query statement below

with testing as (
select distinct voter, candidate, 
       ifnull(1 / sum(candidate is not null) over (partition by voter), 0) as n_c
from votes
), 

testing2 as (
select candidate, sum(n_c) as tot
from testing
where candidate is not null
group by candidate
)

select t.candidate
from (select *, 
       dense_rank() over (order by tot desc) as dr
from testing2) as t
where t.dr = 1
order by t.candidate asc



