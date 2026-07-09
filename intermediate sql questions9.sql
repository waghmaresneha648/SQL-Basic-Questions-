-- Step 1: Create a distinct list of our users
WITH unique_users AS (
    SELECT DISTINCT user_id 
    FROM orders
)
-- Step 2: Use CROSS APPLY to fetch the top 2 orders per user
SELECT 
    u.user_id,
    top_orders.order_id AS top_order_id,
    top_orders.amount AS top_order_amount
FROM unique_users u
CROSS APPLY (
    -- This block executes repeatedly, once for every user in unique_users
    SELECT TOP 2 order_id, amount
    FROM orders o
    WHERE o.user_id = u.user_id
      AND o.status != 'Cancelled'
    ORDER BY amount DESC
) AS top_orders;