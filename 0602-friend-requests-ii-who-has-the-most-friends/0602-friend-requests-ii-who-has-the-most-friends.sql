# Write your MySQL query statement below
with cta as (SELECT requester_id as id
FROM requestAccepted
UNION 
SELECT accepter_id
FROM requestAccepted
),
cte as (
SELECT *
FROM cta c 
JOIN requestAccepted r1 ON c.id = r1.requester_id
UNION 
SELECT *
FROM cta c 
JOIN requestAccepted r2 ON c.id = r2.accepter_id
),
c as(
SELECT  id, count(*) as num
FROM cte
GROUP BY id
)

SELECT * FROM c ORDER BY num desc limit 1



