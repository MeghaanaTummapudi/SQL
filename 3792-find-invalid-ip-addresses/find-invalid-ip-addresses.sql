# Write your MySQL query statement below

-- select *, substring_index(substring_index(ip, '.', 4), '.', 1) as first, substring_index(substring_index(ip, '.', 3), '.', -1) as sec, substring_index(substring_index(ip, '.', 2), '.', -1) as third, substring_index(substring_index(ip, '.', 4), '.', -1) as fourth 
-- from logs

with testing as (
select ip
from logs
where ip not regexp '^(((25[0-5]|2[0-4][0-9]|1[0-9]{2}|[1-9][0-9]?|0)?)\\.){3}((25[0-5]|2[0-4][0-9]|1[0-9]{2}|[1-9][0-9]?|0))?$'
)

select ip, count(*) as invalid_count
from testing
group by ip
order by invalid_count desc, ip desc
