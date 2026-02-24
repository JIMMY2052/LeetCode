# Write your MySQL query statement below

with cte as (
SELECT *,  week(meeting_date,3) as week FROM meetings
), cta as (
SELECT e.employee_id, SUM(duration_hours) as total
FROM employees e JOIN (SELECT * FROM cte) m
ON e.employee_id = m.employee_id
GROUP BY employee_id, week
)

SELECT e.employee_id , employee_name, department, count(*) as meeting_heavy_weeks
FROM employees e JOIN (SELECT * FROM cta) c
ON e.employee_id = c.employee_id
WHERE total > 20
GROUP BY e.employee_id
HAVING count(*) > 1
ORDER BY meeting_heavy_weeks desc, employee_name




