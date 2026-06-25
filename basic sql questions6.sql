--The finance team wants a clean breakdown of our users. They want to see a list of order details (order_id, amount), but only for orders that were placed by users living in 'Mumbai' or 'Bangalore'. Use a CTE to pull the user IDs first.
WITH target_cities AS (
    SELECT user_id 
    FROM users 
    WHERE city IN ('Mumbai', 'Bangalore')
)
SELECT o.order_id, o.amount, o.status
FROM orders o
INNER JOIN target_cities tc 
   ON o.user_id = tc.user_id;
--We want to see which of our orders are pulling more than their weight. Write a query using a CTE that first calculates the overall average order amount across the company, and then displays all columns from the orders table where the order amount is greater than that average.
WITH total_metrics AS (
    SELECT AVG(amount) AS overall_avg 
    FROM orders
)
SELECT o.order_id, o.amount, o.status
FROM orders o
CROSS JOIN total_metrics tm
WHERE o.amount > tm.overall_avg;
   