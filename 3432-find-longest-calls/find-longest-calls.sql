# Write your MySQL query statement below

with testing as (
select t.*
from (select *, 
       rank() over (partition by type order by duration desc) as rn
from calls) as t
where t.rn <= 3
)

select c.first_name, t.type, cast(SEC_TO_TIME(duration) as char) as duration_formatted
from testing as t
left join contacts as c
on c.id = t.contact_id
order by t.type desc, t.duration desc, c.first_name desc
