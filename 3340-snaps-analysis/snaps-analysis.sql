# Write your MySQL query statement below

-- sum(a1.time_spent) over (partition by  a2.age_bucket, a1.activity_type) as val, 
-- sum(a1.time_spent) over (partition by a2.age_bucket) as tot
with testing as (
select distinct a2.age_bucket, a1.activity_type, sum(a1.time_spent) over (partition by  a2.age_bucket, a1.activity_type) as val, 
sum(a1.time_spent) over (partition by a2.age_bucket) as tot
from activities as a1
join age as a2
on a1.user_id = a2.user_id
-- group by a2.age_bucket, a1.activity_type
)

select age_bucket, ifnull(max(case when age_bucket = '21-25' and activity_type = 'send' then round(val * 100 / tot, 2) 
                        when age_bucket = '26-30' and activity_type = 'send' then round(val * 100 / tot, 2)
                        when age_bucket = '31-35' and activity_type = 'send' then round(val * 100 / tot, 2) end), 0) as send_perc, 
                        ifnull(max(case when age_bucket = '21-25' and activity_type = 'open' then round(val * 100 / tot, 2) 
                        when age_bucket = '26-30' and activity_type = 'open' then round(val * 100 / tot, 2)
                        when age_bucket = '31-35' and activity_type = 'open' then round(val * 100 / tot, 2) end), 0) as open_perc
from testing
group by age_bucket
