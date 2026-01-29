# Write your MySQL query statement below

with movies_test as (
select user_id, count(rating) as movie_count
from movierating
group by user_id
), 

rating as (
select movie_id, avg(rating) as avg_rate
from movierating
where month(created_at) = 2 and year(created_at) = 2020
group by movie_id
), 

movies_users as (
select user_id
from movies_test 
where movie_count in (select max(movie_count) from movies_test)
), 

testing as (select mu.user_id, u.name
from movies_users as mu
join users as u
on mu.user_id = u.user_id), 

testing2 as (
select movie_id
from rating
where avg_rate in (select max(avg_rate) from rating)
), 

testing3 as (
select t2.movie_id, m.title
from testing2 as t2
join movies as m
on t2.movie_id = m.movie_id
)


select name as results
from testing 
where name in (select min(name) from testing )
union all
select title as results
from testing3
where title in (select min(title) from testing3)

