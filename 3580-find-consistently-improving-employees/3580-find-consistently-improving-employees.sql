# Write your MySQL query statement below
with cte as (SELECT e.employee_id, name
FROM employees e 
JOIN performance_reviews p ON e.employee_id = p.employee_id
GROUP BY e.employee_id, name
HAVING count(*) >= 3),

cta as(
SELECT p.employee_id, name,rating,review_date,
row_number() over(partition by p.employee_id ORDER BY review_date DESC) as 'rn'
FROM cte c  
JOIN performance_reviews p ON c.employee_id = p.employee_id),
h as (
SELECT * 
FROM cta 
WHERE rn IN (1,2,3)),
e as (

    SELECT *, lead(rating,1) over(partition by h.employee_id order by review_date) as first, 
lead(rating,2) over(partition by h.employee_id order by review_date) as sec
     FROM h
)


SELECT employee_id, name, sec - rating as improvement_score 
FROM e 
WHERE rn =3 AND rating < first AND first < sec 
ORDER BY  improvement_score desc, name


