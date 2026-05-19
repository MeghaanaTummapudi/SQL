# Write your MySQL query statement below

with testing as (
select distinct t.member_id, ((t.n_c * 100) / t.tot) as cr
from (select v.member_id, count(p.visit_id) over (partition by v.member_id) as n_c, 
          count(*) over (partition by v.member_id) as tot
from visits as v
left join purchases as p
on v.visit_id = p.visit_id) as t

)

select m.member_id, m.name, (case when t.cr >= 80 then 'Diamond'
                         when t.cr >= 50 and t.cr < 80 then 'Gold'
                         when t.cr < 50 and t.cr >= 0 then 'Silver'
                         else 'Bronze' end) as category
from members as m
left join testing as t
on m.member_id = t.member_id