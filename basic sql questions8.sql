--The operations team wants to see a history of orders, but they want a running total of the amount spent separately for each individual user. Each time a new user_id appears, the running total should reset back to zero and start counting fresh for that user.
SELECT order_id, user_id, order_date, amount,
    SUM(amount) OVER(
        PARTITION BY user_id 
        ORDER BY order_date
    ) AS user_running_total
FROM orders;
--A very common business request is to find the single largest purchase a user ever made. Write a query that ranks the order amounts from highest to lowest, but resets the ranking for each unique user.
SELECT order_id, user_id, amount, status,
    DENSE_RANK() OVER(
        PARTITION BY user_id 
        ORDER BY amount DESC
    ) AS user_purchase_rank
FROM orders;