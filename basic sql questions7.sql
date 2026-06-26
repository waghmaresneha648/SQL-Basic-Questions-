--The finance team wants a daily tracking report. Write a query to show all details of your orders, sorted by order_date, but add a new column called running_total that keeps adding up the order amount sequentially day by day.
SELECT order_id, order_date, amount,
    SUM(amount) OVER(ORDER BY order_date) AS running_total
FROM orders;
--The sales team wants to see a leaderboard of our highest-earning transactions. Write a query that assigns a rank to each order from highest amount to lowest amount using the DENSE_RANK() function.
SELECT order_id, amount, status,
    DENSE_RANK() OVER(ORDER BY amount DESC) AS order_rank
FROM orders;