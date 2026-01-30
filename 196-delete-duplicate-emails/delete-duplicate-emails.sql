# Write your MySQL query statement below

-- with testing as (
-- select min(id) as id
-- from person
-- group by email
-- having count(email) > 1
-- )

-- delete from person
-- where id not in (select id from testing) and id in (select id from person group by email having count(email) = 1)

with testing as (
select id
from person
where id in (select id from person group by email having count(email) = 1) or id in (select min(id) from person group by email having count(email) > 1)
)

delete from person
where id not in (select id from testing)