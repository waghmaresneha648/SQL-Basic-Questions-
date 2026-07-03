--Identifying Shipping Performance and Bottlenecks
SELECT 
    order_id,
    order_date,
    status,
    amount,
    
    -- Step 1: Classify the operational state
    CASE 
        WHEN status = 'Delivered' THEN 'Completed'
        WHEN status IN ('Shipped', 'Pending') THEN 'In Progress'
        ELSE 'Lost Revenue'
    END AS fulfillment_status,
    
    -- Step 2: Calculate the conditional transit clock
    CASE 
        WHEN status IN ('Shipped', 'Pending') THEN ('2026-04-30'::DATE - order_date)
        ELSE 0
    END AS days_in_flight

FROM orders
ORDER BY order_date ASC;