--The Customer Service Quick-Glance Audit
SELECT 
    user_id,
    
    -- Step 1 & 2: Cast the ID to a string, then concatenate with commas
    STRING_AGG(CAST(order_id AS VARCHAR(10)), ', ') 
        WITHIN GROUP (ORDER BY order_date ASC) AS chronological_order_history

FROM orders
GROUP BY user_id
ORDER BY user_id;