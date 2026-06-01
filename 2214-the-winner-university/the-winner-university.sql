# Write your MySQL query statement below

-- with testing as 
-- select count(distinct student_id) as n_c
-- from NewYork
-- where score >= 90

with testing as (
select student_id, score, 'ny' as tag
from NewYork

union all

select student_id, score, 'ca' as tag
from California
),

testing2 as (
select max(case when t.tag = 'ny' then t.n_c else 0 end) as ny,
       max(case when t.tag = 'ca' then t.n_c else 0 end) as ca
from (select tag, sum(case when score >= 90 then 1 else 0 end) as n_c
from testing
group by tag) as t

)

select (case when ny > ca then 'New York University'
            when ca > ny then 'California University'
        else 'No Winner' end) as Winner
from testing2
