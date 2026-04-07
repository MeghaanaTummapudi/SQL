# Write your MySQL query statement below

-- with testing as (
-- select candidateid as id
-- from vote
-- group by candidateid
-- having count(*) = (select max(t.n)
--                    from (select count(*) as n
--                          from vote
--                          group by candidateid) as t
--                   )
-- )

-- select name
-- from candidate
-- where id in (select id from testing)

with testing as (
select candidateid, count(*) as n
from vote
group by candidateid
)

select name
from candidate
where id in (select candidateid
             from testing
             where n = (select max(n) from testing))


