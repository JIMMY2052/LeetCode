# Write your MySQL query statement below


with cte as (
        SELECT employee_id, manager_id
        FROM employees
        WHERE salary < 30000
)

SELECT  t.employee_id
FROM employees e right join (SELECT * FROM cte) t
ON e.employee_id = t.manager_id
WHERE e.name is null and t.manager_id is not null
ORDER BY employee_id


