# Write your MySQL query statement below

-- with testing as (
-- select distinct voter, candidate, 
--        ifnull(1 / sum(candidate is not null) over (partition by voter), 0) as n_c
-- from votes
-- ), 

-- testing2 as (
-- select candidate, sum(n_c) as tot
-- from testing
-- where candidate is not null
-- group by candidate
-- )

-- select t.candidate
-- from (select *, 
--        dense_rank() over (order by tot desc) as dr
-- from testing2) as t
-- where t.dr = 1
-- order by t.candidate asc

with testing as (
select voter, ifnull(1 / count(*), 0) as n_c
from votes
where candidate is not null
group by voter
), 

testing2 as (
select v.candidate, sum(t.n_c) as tot
from testing as t
join votes as v
on t.voter = v.voter
group by v.candidate
)

select candidate
from testing2
where tot in (select max(tot) from testing2)
order by candidate asc
