SELECT 
    user_id,
    
    SUM(CASE WHEN status = 'Delivered' THEN amount ELSE 0 END) AS delivered_revenue,
    SUM(CASE WHEN status = 'Pending' THEN amount ELSE 0 END) AS pending_revenue,
    SUM(CASE WHEN status = 'Cancelled' THEN amount ELSE 0 END) AS lost_revenue

FROM orders
GROUP BY user_id
ORDER BY user_id;