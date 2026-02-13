# Write your MySQL query statement below

select distinct c.title
from content as c
join tvprogram as tv
on c.content_id = tv.content_id
where c.kids_content = 'Y' and date_format(tv.program_date, '%Y-%m') = '2020-06' and c.content_type = 'Movies'