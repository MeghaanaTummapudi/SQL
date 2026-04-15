# Write your MySQL query statement below

with testing as (
select distinct sub_id
from submissions
where parent_id is null
)

select t.sub_id as post_id, count(distinct s.sub_id) as number_of_comments 
from testing as t
left join submissions as s
on t.sub_id = s.parent_id
group by t.sub_id
order by post_id asc