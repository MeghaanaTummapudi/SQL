# Write your MySQL query statement below

with positive as (
select patient_id, result, min(test_date) as td
from covid_tests 
where result = 'Positive'
group by patient_id
), 

negative as (
select patient_id, result, min(test_date) as td
from covid_tests 
where result = 'Negative'
group by patient_id
), 

fin_test as (
select ct.patient_id, min(datediff(ct.test_date, p.td)) as recovery_time
from covid_tests as ct
join positive as p
on ct.patient_id = p.patient_id
join negative as n
on ct.patient_id = n.patient_id
where ct.result = 'Negative' and ct.test_date > p.td
group by ct.patient_id
)

select f.patient_id, pt.patient_name, pt.age, f.recovery_time
from patients as pt
join fin_test as f
on pt.patient_id = f.patient_id
order by recovery_time, patient_name asc