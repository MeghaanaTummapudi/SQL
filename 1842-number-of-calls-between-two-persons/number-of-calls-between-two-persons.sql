# Write your MySQL query statement below

select  (case when from_id > to_id then to_id else from_id end) as person1, 
        (case when from_id < to_id then to_id else from_id end) as person2, 
        count(duration) as call_count, sum(duration) as total_duration
from calls
group by person1, person2