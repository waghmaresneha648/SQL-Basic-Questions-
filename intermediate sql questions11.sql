--Defending Against Data Corruption
WITH sanitized_orders AS (
    -- Step 1: Safely filter and convert user IDs
    SELECT 
        TRY_CONVERT(INT, user_id) AS clean_user_id,
        amount,
        status
    FROM orders
)
-- Step 2: Run the normal aggregate logic on the safe dataset
SELECT 
    clean_user_id,
    SUM(amount) AS total_spend
FROM sanitized_orders
WHERE clean_user_id IS NOT NULL -- Drops the corrupted legacy rows
  AND status != 'Cancelled'
GROUP BY clean_user_id
ORDER BY total_spend DESC;