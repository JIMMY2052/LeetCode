# Write your MySQL query statement below
with cte as ( SELECT managerID FROM employee group by managerID HAVING count(*)>=5)


SELECT name FROM employee WHERE id IN (SELECT managerID FROM cte)