# Write your MySQL query statement below

with testing as (
select '[0-5>' as cases

union

select '[5-10>' as cases

union 

select '[10-15>' as cases

union

select '15 or more' as cases
),

testing2 as (
select t.*, 
       (case when t.mins >= 0 and t.mins <= 5 then '[0-5>' 
            when t.mins > 5 and t.mins <= 10 then '[5-10>'
            when t.mins > 10 and t.mins <= 15 then '[10-15>'
        else '15 or more' end) as tst
from (select *, round((duration / 60), 2) as mins
from sessions) as t
)

select t.cases as bin, ifnull(count(t2.tst), 0) as total
from testing as t
left join testing2 as t2
on t.cases = t2.tst
group by t.cases