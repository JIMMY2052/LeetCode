# Write your MySQL query statement below
DELETE
FROM
person
WHERE Id not IN
(
SELECT minid
FROM
(SELECT email, min(id) as minid
FROM Person
GROUP BY email) test)

