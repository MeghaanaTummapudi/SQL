# Write your MySQL query statement below

with highest_avg as (
select title, avg(rating) as rating
from movies as m
left join movierating as r
on m.movie_id = r.movie_id and month(created_at) = 02 and year(created_at) = 2020
group by title
order by rating desc, title asc
limit 1
),

highest_users as (
select u.user_id, u.name as name, count(*) as nc
from users as u
left join movierating as r
on u.user_id = r.user_id
group by u.user_id
order by nc desc, u.name asc
limit 1
)

select name as results
from highest_users

union all

select title as results
from highest_avg 