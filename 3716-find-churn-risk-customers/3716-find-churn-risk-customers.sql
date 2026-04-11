# Write your MySQL query statement below
with a as (SELECT  user_id , datediff(max(event_date),min(event_date)) as diff
FROM subscription_events
GROUP BY user_id
HAVING datediff(max(event_date),min(event_date)) >= 60 )
, b as (SELECT a.user_id , max(event_date) as maxDT
FROM a join subscription_events s
ON a.user_id =  s.user_id
GROUP BY a.user_id
)
, c as (
SELECT b.user_id, plan_name as current_plan , monthly_amount as current_monthly_amount
FROM b JOIN subscription_events s
ON b.user_id =  s.user_id AND b.maxDT = s.event_date
WHERE event_type  = 'downgrade'
)
, d as(
SELECT c.user_id,max(monthly_amount) as m
FROM c JOIN subscription_events s 
ON c.user_id =  s.user_id
GROUP BY c.user_id
)

SELECT c.*, d.m as max_historical_amount, a.diff as days_as_subscriber
FROM d JOIN c
on d.user_id = c.user_id
JOIN a
ON d.user_id = a.user_id
WHERE c.current_monthly_amount / d.m  < .5
ORDER BY  days_as_subscriber DESC, user_id




