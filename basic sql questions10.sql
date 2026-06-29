--The growth team wants to see a row-by-row transaction timeline. Write a query to display the order_id, order_date, and amount, along with a fourth column called previous_order_amount that displays the value of the order placed immediately before it.
SELECT order_id, order_date, amount,
    LAG(amount, 1) OVER(ORDER BY order_date) AS previous_order_amount
FROM orders;
--To understand buyer velocity, we want to know how quickly users return to shop. Write a query that shows each order's date, and a new column called next_order_date that previews the date of the very next order in the system.
SELECT order_id, order_date,
    LEAD(order_date, 1) OVER(ORDER BY order_date) AS next_order_date
FROM orders;