--Finding the First Acquisition Purchase
WITH ranked_orders AS (
    -- Step 1: Filter valid statuses and assign a row number
    SELECT 
        order_id,
        user_id,
        order_date,
        amount,
        ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY order_date ASC) AS purchase_sequence
    FROM orders
    WHERE status IN ('Delivered', 'Shipped')
)
-- Step 2: Extract only the first sequence
SELECT 
    order_id,
    user_id,
    order_date,
    amount
FROM ranked_orders
WHERE purchase_sequence = 1
ORDER BY user_id;