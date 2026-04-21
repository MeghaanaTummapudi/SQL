# Write your MySQL query statement below

with testing as (
select user_id, count(*) as contacts_cnt
from contacts
group by user_id
), 

testing2 as (
select user_id, count(*) as trusted_contacts_cnt
from contacts 
where contact_email in (select email from customers)
group by user_id
)

select i.invoice_id, cu.customer_name, i.price, ifnull(t.contacts_cnt, 0) as contacts_cnt, ifnull(t2.trusted_contacts_cnt, 0) as trusted_contacts_cnt
from invoices as i
left join customers as cu
on i.user_id = cu.customer_id
left join testing as t
on i.user_id = t.user_id 
left join testing2 as t2
on i.user_id = t2.user_id
order by i.invoice_id asc