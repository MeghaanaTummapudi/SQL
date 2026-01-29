# Write your MySQL query statement below

with testing as (
select count(*) as n_c
from seat
)

select 
       (case when id % 2 = 1 and id <> (select n_c from testing) then id + 1
            when id % 2 = 0 then id - 1     
        else id end) as id, student
from seat
order by id asc
