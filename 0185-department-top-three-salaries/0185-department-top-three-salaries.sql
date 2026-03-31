# Write your MySQL query statement below
with cte as (SELECT d.name as d, e.name as e, salary, dense_rank() over(partition by d.id order by salary desc) as rn
FROM employee e 
JOIN department d ON e.departmentID = d.id)

SELECT d as Department,  e as Employee, Salary
FROM cte
WHERE rn IN (1,2,3)

