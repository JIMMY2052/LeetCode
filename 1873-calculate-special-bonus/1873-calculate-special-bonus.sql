# Write your MySQL query statement below
SELECT e.employee_id , CASE WHEN t.employee_id IS NULL THEN 0 ELSE salary END AS bonus
FROM employees e LEFT JOIN (SELECT employee_id
FROM employees
WHERE employee_id % 2 != 0 AND name NOT LIKE 'M%') t
ON e.employee_id = t.employee_id
ORDER BY e.employee_id
