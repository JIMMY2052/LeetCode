# Write your MySQL query statement below
SELECT d.name as Department, e.name as Employee , e.salary as salary
FROM employee e JOIN department d
ON e.departmentId = d.id
AND
(e.DepartmentId, e.Salary) in
(select e.DepartmentId, max(e.Salary) from Employee e group by e.DepartmentId);

