SELECT 
    user_id, 
    SUM(amount) AS total_valid_spend
FROM orders
WHERE status IN ('Delivered', 'Shipped')
GROUP BY user_id
HAVING SUM(amount) > 3000
ORDER BY total_valid_spend DESC;