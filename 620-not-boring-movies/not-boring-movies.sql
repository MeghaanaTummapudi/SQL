# Write your MySQL query statement below

select *
from cinema
where description <> 'boring' and id regexp '[^02468]'
order by rating desc