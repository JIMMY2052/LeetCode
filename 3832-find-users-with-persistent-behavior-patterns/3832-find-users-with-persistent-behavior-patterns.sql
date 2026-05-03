WITH Streaks AS (
    SELECT 
        user_id, 
        action, 
        action_date,
        -- Subtracting row number from date creates a constant grouping value for consecutive dates
        DATE_SUB(action_date, INTERVAL ROW_NUMBER() OVER(PARTITION BY user_id, action ORDER BY action_date) DAY) AS grp
    FROM activity
),
GroupedStreaks AS (
    SELECT 
        user_id, 
        action, 
        COUNT(*) AS streak_length, 
        MIN(action_date) AS start_date, 
        MAX(action_date) AS end_date
    FROM Streaks
    GROUP BY user_id, action, grp
),
MaxStreaks AS (
    SELECT *,
        -- Rank users by their longest streak to handle the "maximum length" requirement
        RANK() OVER(PARTITION BY user_id ORDER BY streak_length DESC) AS rnk
    FROM GroupedStreaks
    WHERE streak_length >= 5
)
SELECT 
    user_id, 
    action, 
    streak_length, 
    start_date, 
    end_date
FROM MaxStreaks
WHERE rnk = 1
ORDER BY streak_length DESC, user_id ASC;
