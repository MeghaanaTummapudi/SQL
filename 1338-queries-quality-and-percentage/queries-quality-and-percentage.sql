# Write your MySQL query statement below
-- round(sum(rating/position) / count(query_name), 2) as quality

with qual as (
select query_name, count(rating) as rat
from queries
where rating < 3
group by query_name
)

select q.query_name, round(sum(q.rating/q.position) / count(q.query_name), 2) as quality, 
       ifnull(round((t.rat/count(q.query_name) * 100), 2), 0) as  poor_query_percentage
from queries as q
left join qual as t
on q.query_name = t.query_name
where q.query_name is not null
group by q.query_name
-- select query_name, round(sum(rating/position) / count(query_name), 2) as quality
-- from queries
-- group by query_name