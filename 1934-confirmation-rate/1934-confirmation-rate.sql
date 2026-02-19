# Write your MySQL query statement below
with cte as (SELECT user_id, count(*) as total
FROM confirmations
GROUP BY user_id),
con as (
SELECT user_id, count(*) as confirm
FROM confirmations
WHERE action = 'confirmed'
GROUP BY user_id
)

SELECT u.user_id , coalesce(cast((confirm/total) as decimal(10,2)), 0.00) as confirmation_rate
FROM signups u LEFT JOIN (SELECT user_id, total FROM cte) t ON u.user_id = t.user_id
LEFT JOIN (SELECT user_id, confirm FROM con) c ON u.user_id = c.user_id