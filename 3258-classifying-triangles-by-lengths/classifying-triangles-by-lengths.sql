# Write your MySQL query statement below

select  (case when a = b and a = c and b = c then 'Equilateral'
                when (a = b or b = c or a = c) and (a + b > c and b + c > a and a + c > b) then 'Isosceles'
                when a + b <= c or b + c <= a or a + c <= b then 'Not A Triangle'
            else 'Scalene' end) as triangle_type
from triangles