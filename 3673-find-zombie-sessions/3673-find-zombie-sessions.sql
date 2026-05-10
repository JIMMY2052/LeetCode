# Write your MySQL query statement below

with a as(SELECT session_id, SUM(CASE WHEN event_type = 'scroll' THEN 1 END) as num,
min(event_timestamp) as opentime, max(event_timestamp) as closetime,
SUM(CASE WHEN event_type != 'scroll' and event_type !='app_open' and event_type !='app_close' THEN 1 ELSE 0 END) as clickCount
FROM app_events
GROUP BY session_id)

SELECT a.session_id, user_id, TIMESTAMPDIFF(minute, opentime,closetime ) as session_duration_minutes, num as scroll_count
FROM a JOIN app_events e
ON a.session_id = e.session_id
WHERE num >= 5 and TIMESTAMPDIFF(minute, opentime,closetime ) >= 30 and clickCount/ num < .2
GROUP BY a.session_id, user_id
ORDER BY scroll_count desc, session_id


