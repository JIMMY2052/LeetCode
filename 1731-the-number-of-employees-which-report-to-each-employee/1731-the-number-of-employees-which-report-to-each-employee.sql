-- # Write your MySQL query statement below
SELECT e1.employee_id, e1.name, count(*) AS reports_count, round(sum(e2.age) / count(*)) as average_age
FROM employees e1 JOIN employees e2 
ON  e2.reports_to = e1.employee_id
GROUP BY e1.employee_id
ORDER BY e1.employee_id


