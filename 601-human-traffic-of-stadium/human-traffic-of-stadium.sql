# Write your MySQL query statement below

-- with testing as (
-- select s1.id as id1, s2.id as id2, s3.id as id3
-- from stadium as s1
-- join stadium as s2
-- on s1.id < s2.id and s2.id - s1.id = 1
-- join stadium as s3
-- on s2.id < s3.id and s3.id - s2.id = 1
-- where s1.people >= 100 and s2.people >= 100 and s3.people >= 100
-- )

-- select *
-- from stadium
-- where id in (select id1 from testing) or id in (select id2 from testing)
-- or id in (select id3 from testing)
-- order by visit_date asc

with testing as (
select t.*, t.id - t.r as tdif
from (select *, 
       row_number() over (order by id) as r
from stadium 
where people >= 100) as t 
), 

testing2 as (
select id - r as dif, count(*) as n
from testing
group by (id - r)
having n >= 3
)

select t1.id, t1.visit_date, t1.people
from testing2 as t2
join testing as t1
on t2.dif = t1.tdif
order by t1.visit_date

