# Write your MySQL query statement below
SELECT user_id, max(time_stamp) as last_stamp
FROM logins
WHERE year(time_stamp) = 2020
GROUP BY user_id