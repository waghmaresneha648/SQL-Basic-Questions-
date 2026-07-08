WITH user_spend AS (
    -- Step 1: Aggregate the total valid spend per user
    SELECT 
        user_id,
        SUM(amount) AS total_spend
    FROM orders
    WHERE status != 'Cancelled'
    GROUP BY user_id
)
-- Step 2: Dynamically segment them into 2 equal buckets
SELECT 
    user_id,
    total_spend,
    NTILE(2) OVER(ORDER BY total_spend DESC) AS spending_tier
FROM user_spend;