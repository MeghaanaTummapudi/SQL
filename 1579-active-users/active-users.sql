# Write your MySQL query statement below

with testing as (
select *
from (select *, 
       dense_rank() over (partition by id order by login_date) as tst
    from logins) as t
group by t.id, t.tst
),

testing2 as (
select *, date_sub(login_date, interval tst day) as tru
from testing
)

select id, name
from accounts
where id in (select distinct id
from testing2
group by id, tru
having count(*) >= 5)
order by id

