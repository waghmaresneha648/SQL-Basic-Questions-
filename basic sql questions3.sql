--The marketing team wants a complete directory of all registered users and their total spending. They want to see every single user's name from the users table, alongside their order amounts. If a user hasn't ordered anything yet, their name should still show up.
SELECT u.user_name, o.order_id, o.amount
FROM users u
LEFT JOIN orders o 
   ON u.user_id = o.user_id;
--Write a query to find the total amount spent by each user_name. If a user hasn't spent anything, show their total as NULL or 0.
SELECT u.user_name, SUM(o.amount) AS total_spent
FROM users u
LEFT JOIN orders o 
   ON u.user_id = o.user_id
GROUP BY u.user_name;
--The product team wants to run an email campaign targeting users who have registered but have never placed an order. Write a query to find the user_name of anyone who has 0 orders.
SELECT u.user_name
FROM users u
LEFT JOIN orders o 
   ON u.user_id = o.user_id
WHERE o.order_id IS NULL;