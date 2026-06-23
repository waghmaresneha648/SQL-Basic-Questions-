--The logistics team wants to group orders into two simple operational buckets: if an order is 'Delivered' or 'Shipped', it is 'Active'. If it is anything else, it is 'In-Queue'. Write a query to show the order_id, status, and a new column called delivery_group using this logic.
SELECT order_id, status,
    CASE 
        WHEN status IN ('Delivered', 'Shipped') THEN 'Active'
        ELSE 'In-Queue'
    END AS delivery_group
FROM orders;
--The finance team wants to classify order sizes. Write a query that returns the order_id and amount, along with a column named price_segment that labels orders as premium, mid-tier,mass.
SELECT order_id, amount,
    CASE 
        WHEN amount >= 2000 THEN 'Premium'
        WHEN amount >= 1000 THEN 'Mid-Tier'
        ELSE 'Mass'
    END AS price_segment
FROM orders;
--Can we count how many 'Premium' vs 'Mass' orders we have? Write a query that combines CASE WHEN with GROUP BY to show the count of orders in each price_segment.
SELECT 
    CASE 
        WHEN amount >= 2000 THEN 'Premium'
        WHEN amount >= 1000 THEN 'Mid-Tier'
        ELSE 'Mass'
    END AS price_segment,
    COUNT(*) AS total_orders
FROM orders
GROUP BY price_segment;
