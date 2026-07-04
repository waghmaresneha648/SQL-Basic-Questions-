WITH ordered_sequences AS (
    -- Step 1: Map each order to its immediate next order ID per user
    SELECT 
        user_id,
        order_id AS current_order_id,
        order_date AS current_order_date,
        LEAD(order_id) OVER(PARTITION BY user_id ORDER BY order_date) AS next_order_id
    FROM orders
)
-- Step 2: Self-join back to the raw table to grab the next order's details
SELECT 
    os.user_id,
    os.current_order_id AS first_order_id,
    os.current_order_date AS first_order_date,
    os.next_order_id,
    o2.order_date AS next_order_date,
    
    -- Step 3: Calculate the calendar footprint gap
    (o2.order_date - os.current_order_date) AS days_between_purchases

FROM ordered_sequences os
INNER JOIN orders o2 
    ON os.next_order_id = o2.order_id
ORDER BY os.user_id, first_order_date;