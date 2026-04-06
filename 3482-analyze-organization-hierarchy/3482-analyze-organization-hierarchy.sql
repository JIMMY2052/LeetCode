WITH RECURSIVE hierarchy AS (
    -- Start from CEO
    SELECT 
        employee_id,
        employee_name,
        manager_id,
        salary,
        1 AS level
    FROM Employees
    WHERE manager_id IS NULL

    UNION ALL

    -- Get each employee's level
    SELECT 
        e.employee_id,
        e.employee_name,
        e.manager_id,
        e.salary,
        h.level + 1 AS level
    FROM Employees e
    JOIN hierarchy h
        ON e.manager_id = h.employee_id
),
subordinates AS (
    -- Direct reports
    SELECT 
        manager_id AS manager_id,
        employee_id AS subordinate_id
    FROM Employees
    WHERE manager_id IS NOT NULL

    UNION ALL

    -- Indirect reports
    SELECT 
        s.manager_id,
        e.employee_id AS subordinate_id
    FROM subordinates s
    JOIN Employees e
        ON e.manager_id = s.subordinate_id
),
team_budget AS (
    SELECT 
        e.employee_id,
        COUNT(s.subordinate_id) AS team_size,
        COALESCE(SUM(sub.salary), 0) + e.salary AS budget
    FROM Employees e
    LEFT JOIN subordinates s
        ON e.employee_id = s.manager_id
    LEFT JOIN Employees sub
        ON s.subordinate_id = sub.employee_id
    GROUP BY e.employee_id, e.salary
)

SELECT 
    h.employee_id,
    h.employee_name,
    h.level,
    tb.team_size,
    tb.budget
FROM hierarchy h
JOIN team_budget tb
    ON h.employee_id = tb.employee_id
ORDER BY 
    h.level ASC,
    tb.budget DESC,
    h.employee_name ASC;