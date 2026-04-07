# Write your MySQL query statement below

with testing as (
select e.department_id, s.amount, s.pay_date, 
       avg(s.amount) over (partition by e.department_id, month(s.pay_date), year(s.pay_date) ) as emp_sal,
       avg(s.amount) over (partition by month(s.pay_date), year(s.pay_date)) as comp_sal
 from salary as s
 join employee as e
 on s.employee_id = e.employee_id
)

select department_id, date_format(pay_date, '%Y-%m') as pay_month, 
       (case when emp_sal > comp_sal then 'higher'
             when emp_sal < comp_sal then 'lower'
             when emp_sal = comp_sal then 'same'
        else null end) as comparison
from testing
group by department_id, date_format(pay_date, '%Y-%m')
