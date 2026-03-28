# Write your MySQL query statement below
with cta as (SELECT d.driver_id, driver_name,
 AVG(CASE WHEN month(trip_date) IN (1,2,3,4,5,6) THEN (distance_km / fuel_consumed) END) AS 'first_half_avg',
 AVG(CASE WHEN month(trip_date) IN (7,8,9,10,11,12) THEN (distance_km / fuel_consumed) END) AS 'second_half_avg'
FROM trips t JOIN drivers d ON t.driver_id = d.driver_id
GROUP BY driver_id)

SELECT driver_id,driver_name,round(first_half_avg,2) as first_half_avg ,round(second_half_avg,2) as second_half_avg, round(second_half_avg - first_half_avg,2) as efficiency_improvement
FROM cta 
WHERE first_half_avg is not null AND second_half_avg is not null AND second_half_avg > first_half_avg
ORDER BY efficiency_improvement desc, driver_name asc