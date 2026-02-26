# Write your MySQL query statement belowS
SELECT user_id, count(*) as followers_count
FROM followers
GROUP BY user_id
ORDER BY user_id