CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      # Write your MySQL query statement below.
      with testing as (
      select distinct t.salary, 
             dense_rank() over (order by salary desc) as r
      from ( select *
      from employee) as t
    --   group by salary) as t
    --   having count(salary) = 1) as t
      )
      
      select salary
      from testing
      where r = n

  );
END