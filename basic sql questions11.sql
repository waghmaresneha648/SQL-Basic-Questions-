--A user manually typed a status filter into a dashboard as 'delivered' (all lowercase). Write a query that dynamically converts the status column to lowercase so that it safely matches their filter and pulls all matching rows.
SELECT order_id, status, amount
FROM orders
WHERE LOWER(status) = 'delivered';
--The operations team wants to create a shortened 3-letter tracking code for every order. Write a query that returns the order_id and a new column called status_code which contains just the first 3 letters of the status in all capital letters (e.g., 'Delivered' should become 'DEL').
SELECT order_id, status,
    UPPER(LEFT(status, 3)) AS status_code
FROM orders;
--Data integrity check! Write a query to find the order_id, the status, and the length (number of letters) of each status string. Sort the results so that the status with the longest text appears at the top.
SELECT order_id, status,
    LENGTH(status) AS status_length
FROM orders
ORDER BY status_length DESC;