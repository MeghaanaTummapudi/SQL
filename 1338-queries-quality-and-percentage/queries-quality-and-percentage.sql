# Write your MySQL query statement below

/*
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
*/

select query_name, round(sum(rating/position) / count(query_name), 2) as quality,
       round((sum(case when rating < 3 then 1 else 0 end) / count(query_name) * 100), 2) as poor_query_percentage 
from queries
where query_name is not null
group by query_name
