# Write your MySQL query statement below

with testing as (
-- select t.employee_id, t.review_date, (t.l3 - t.l1) as imp_score, t.n_c
select t.*
from (select employee_id, review_date, rating as l1, 
       lead(rating, 1) over (partition by employee_id order by review_date asc) as l2, 
       lead(rating, 2) over (partition by employee_id order by review_date asc) as l3, 
       count(*) over (partition by employee_id) as n_c
from performance_reviews) as t
where (t.n_c >= 3) 
), 

-- select t.employee_id, e.name, t.imp_score as improvement_score
-- from testing as t
-- left join employees as e
-- on t.employee_id = e.employee_id
-- where (t.employee_id, t.review_date) in (select employee_id, max(review_date) from testing group by employee_id)
-- order by t.imp_score desc, e.name asc

testing2 as (
select t.employee_id, t.l3 - t.l1 as imp_score
from (select *, rank() over (partition by employee_id order by review_date desc) as rn
from testing 
where l1 is not null and l2 is not null and l3 is not null) as t
where t.rn = 1 and t.l3 - t.l2 >= 1 and t.l2 - t.l1 >= 1
)

select t2.employee_id, e.name, t2.imp_score as improvement_score
from testing2 as t2
left join employees as e
on t2.employee_id = e.employee_id
order by t2.imp_score desc, e.name asc