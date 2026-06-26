# Write your MySQL query statement below

with testing as (
select distinct p.post_id, k.topic_id as n_c
from posts as p
left join keywords as k
on concat('% ', lower(p.content), ' %') like concat('% ', lower(k.word), ' %')
)

select post_id, ifnull(group_concat(n_c order by n_c asc separator ','), 'Ambiguous!') as topic
from testing
group by post_id
