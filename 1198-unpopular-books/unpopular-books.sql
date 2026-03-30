# Write your MySQL query statement below

-- date <= '2019-05-23' - less than 1 month from todays date -- where available_from < date_sub('2019-06-23', interval 30 day)
-- date <= '2018-05-24' - last year, so date conditions are '2018-05-24' to '2019-05-23' both dates included

with testing as (
select *
from books
where available_from <= '2019-05-23'
)

select t.book_id, t.name
from testing as t
left join orders as o
on t.book_id = o.book_id
group by t.book_id
having sum(case when o.dispatch_date between '2018-06-23' and '2019-06-23' then quantity else 0 end) < 10



