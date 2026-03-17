-- # Write your MySQL query statement below
with cta as (SELECT customer_id, COALESCE(SUM(CASE WHEN transaction_type = 'refund' THEN 1 end), 0) / count(*) as type
FROM customer_transactions
GROUP BY customer_id
HAVING count(*) >= 3  AND (DATEDIFF(MAX(transaction_date), MIN(transaction_date)) >= 30))

SELECT customer_id
FROM cta
WHERE type < 0.2






