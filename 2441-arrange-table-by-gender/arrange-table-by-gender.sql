# Write your MySQL query statement below

-- with testing as (
-- select *, 
--        rank() over (partition by gender order by user_id asc) as rn
-- from genders
-- )

-- select user_id, gender
-- from testing
-- order by rn

-- select 1 as n, 'female' as gender

-- union all

-- select 2 as n, 'other' as gender

-- union all

-- select 3 as n, 'male' as gender

with testing as (
select *, 
       (case when gender = 'female' then 1
            when gender = 'other' then 2
        else 3 end) as gr
from genders
)

select t.user_id, t.gender
from (select *, 
       rank() over (partition by gender order by user_id asc) as rn
from testing) as t
order by t.rn, t.gr
