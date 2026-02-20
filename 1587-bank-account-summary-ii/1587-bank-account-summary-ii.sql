# Write your MySQL query statement below
SELECT name, sum(amount) as balance
FROM users u JOIN transactions t ON u.account = t.account
GROUP BY t.account
HAVING sum(amount) > 10000
