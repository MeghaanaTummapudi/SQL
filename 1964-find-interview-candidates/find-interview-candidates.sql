# Write your MySQL query statement below

with testing as (
 
select contest_id as id, gold_medal as user_id, 'gold' as med
from contests

union all 

select contest_id as id, silver_medal as user_id, 'silver' as med
from contests

union all

select contest_id as id, bronze_medal as user_id, 'bronze' as med
from contests
),

testing2 as (
select distinct f1.user_id as user_id
from testing as f1
left join testing as f2
on f2.id > f1.id and f2.id - f1.id  = 1 
left join testing as f3
on f3.id > f2.id and f3.id - f2.id  = 1 
where f1.user_id = f2.user_id and f1.user_id = f3.user_id and f2.user_id = f3.user_id
), 

testing3 as (
select distinct user_id
from testing
where med = 'gold'
group by user_id
having count(*) >= 3
)

select name, mail
from users 
where user_id in (select user_id from testing3) or user_id in (select user_id from testing2)


