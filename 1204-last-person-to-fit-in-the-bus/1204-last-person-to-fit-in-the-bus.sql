# Write your MySQL query statement below

with cte as(
SELECT *, sum(weight) over( order by turn)  as total_weight
FROM queue
)

select person_name
FROM cte
WHERE total_weight <=1000
ORDER BY  total_weight desc
LIMIT 1