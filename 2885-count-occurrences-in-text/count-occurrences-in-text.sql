# Write your MySQL query statement below

with testing as (
select  sum(case when lower(content) like '% bull %' then 1 else 0 end) as bull_c, 
sum(case when lower(content) like '% bear %' then 1 else 0 end) as bear_c
from files
-- group by file_name
), 

testing2 as (
select 'bull' as word

union all

select 'bear' as word
)

select word, (case when word = 'bull' then bull_c else bear_c end) as count
from testing2
cross join testing

