# Write your MySQL query statement below

with testing as (
select book_id, count(*) as n_c
from borrowing_records as br
where return_date is null
group by book_id
)

select t.book_id, lb.title, lb.author, lb.genre, lb.publication_year, t.n_c as current_borrowers
from library_books as lb
join testing as t
on lb.book_id = t.book_id
where lb.total_copies = t.n_c
order by current_borrowers desc, lb.title asc