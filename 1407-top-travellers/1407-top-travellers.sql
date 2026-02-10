# Write your MySQL query statement below
SELECT u.name, sum(COALESCE(r.distance,0)) as travelled_distance
FROM users u left JOIN rides r ON u.id = r.user_id
GROUP BY u.name, u.id
ORDER BY travelled_distance DESC, u.name ASC