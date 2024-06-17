# Write your MySQL query statement below

with testing as (
select p1.id
from person as p1
cross join person as p2
on p1.email = p2.email and p1.id > p2.id
)

delete from person
where id  in (select * from testing)