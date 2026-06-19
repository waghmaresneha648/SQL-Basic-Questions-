SELECT * FROM orders;
--The VP of Sales wants a quick health check on overall revenue. Write a query to find the total revenue (sum of all total_amount) and the average order value across the entire orders table.
SELECT SUM(amount) AS total_revenue ,AVG(amount) AS average_revenue FROM orders;
--We need to know how active our user base is. Write a query to count the total number of orders placed in this table.
SELECT COUNT(*) AS total_order_count FROM orders;
--Let's look at customer behavior. Write a query to find the total amount spent by each customer_id. (Hint: You will need to bucket the data by the customer).
SELECT user_id, SUM(amount) AS total_spend FROM orders GROUP BY user_id ORDER BY user_id ASC;
--The logistics team wants to look at performance bottlenecks. Write a query to find the total number of orders for each status type.
SELECT status, COUNT(*) AS number_of_orders
FROM orders
GROUP BY status;
--Let's filter our aggregated data. Write a query to show the total amount spent by each customer, but only for orders that have a status of 'Completed'.
SELECT user_id ,SUM(amount) AS total_spend FROM orders WHERE status='Delivered' GROUP BY user_id;
