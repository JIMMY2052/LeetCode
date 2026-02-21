# Write your MySQL query statement below
SELECT contest_id, round(count(*) / (SELECT count(*) FROM users) * 100,2) as percentage
FROM users u RIGHT JOIN register r
ON u.user_id = r.user_id
GROUP BY contest_id
ORDER BY percentage desc, contest_id asc