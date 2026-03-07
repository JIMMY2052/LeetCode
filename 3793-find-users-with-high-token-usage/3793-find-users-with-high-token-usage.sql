# Write your MySQL query statement below
with cte as  (
    SELECT user_id, count(*) as prompt_count, round(avg(tokens),2) AS avg_tokens
FROM prompts
GROUP BY user_id
HAVING count(*) >= 3)


SELECT c.user_id , prompt_count, avg_tokens
FROM cte c JOIN prompts p
ON c.user_id = p.user_id AND p.tokens > avg_tokens
GROUP BY c.user_id , prompt_count, avg_tokens
ORDER BY avg_tokens desc, user_id

