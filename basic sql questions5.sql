--The management wants to review exceptional transactions. Write a query to find all details of orders where the amount is greater than the average order amount of the entire table.
SELECT order_id, user_id, amount, status
FROM orders
WHERE amount > (
    SELECT AVG(amount) FROM orders
);
--The marketing team wants to find details of orders, but only for orders placed by users who live in 'Mumbai'. Solve this by writing a subquery that looks up Mumbai user IDs from the users table first.
SELECT order_id, amount, status
FROM orders
WHERE user_id IN (
    SELECT user_id 
    FROM users 
    WHERE city = 'Mumbai'
);
--Let's look at a scalar subquery in action. Write a query to show each order_id, amount, and a third column that displays the overall total revenue of the company on every single row so managers can see how much each order contributes to the big picture.
SELECT order_id, amount,
    (SELECT SUM(amount) FROM orders) AS company_total_revenue
FROM orders;