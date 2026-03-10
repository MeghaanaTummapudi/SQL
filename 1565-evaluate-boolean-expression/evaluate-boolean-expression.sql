# Write your MySQL query statement below

with testing as (
select e.left_operand, e.operator, e.right_operand,
       (case when operator = '>' then (v1.value > v2.value)
            when operator = '<' then v1.value < v2.value
            when operator = '=' then v1.value = v2.value
       else null end) as tst
from expressions as e
left join variables as v1
on e.left_operand = v1.name
left join variables as v2
on e.right_operand = v2.name
)

select left_operand, operator, right_operand, if(tst > 0, 'true', 'false') as value
from testing
