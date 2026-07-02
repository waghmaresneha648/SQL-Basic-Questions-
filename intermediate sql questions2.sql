WITH user_behavior_metrics AS (
    -- Step 1: Clean data and calculate metrics per user
    SELECT 
        user_id,
        COUNT(order_id) AS total_orders,
        AVG(amount) AS average_order_value
    FROM orders
    WHERE status != 'Cancelled'  -- Strip out cancelled transactions first
    GROUP BY user_id
)
-- Step 2: Use the calculated metrics to segment users
SELECT 
    user_id,
    total_orders,
    ROUND(average_order_value, 2) AS average_order_value,
    
    CASE 
        WHEN total_orders > 1 AND average_order_value < 2000 THEN 'High Frequency, Low Value'
        WHEN total_orders > 1 AND average_order_value >= 2000 THEN 'High Frequency, High Value'
        ELSE 'Standard Frequency'
    END AS user_profile_segment
FROM user_behavior_metrics
ORDER BY total_orders DESC;