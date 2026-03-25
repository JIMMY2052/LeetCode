# Write your MySQL query statement below
with cte as (SELECT user_id
FROM useractivity
WHERE activity_type = 'paid'
GROUP BY user_id)

SELECT c.user_id, 
round(sum(CASE WHEN activity_type = "free_trial" THEN activity_duration ELSE 0 END) / COUNT(CASE WHEN activity_type = "free_trial" THEN 1 END),2) AS trial_avg_duration,
round(sum( CASE  WHEN activity_type = "paid" THEN activity_duration ELSE 0 END) / count( CASE  WHEN activity_type = "paid" THEN 1 END ),2)AS paid_avg_duration
FROM cte c
JOIN userActivity u ON c.user_id = u.user_id
GROUP BY c.user_id
