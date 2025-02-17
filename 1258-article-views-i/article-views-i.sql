# Write your MySQL query statement below

-- select distinct author_id as id
-- from Views
-- where author_id = viewer_id
-- order by id asc


select author_id as id
from Views 
where viewer_id = author_id
group by author_id, viewer_id
having count(author_id) >= 1
order by id asc