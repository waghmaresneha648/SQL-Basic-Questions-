--The executive team wants a high-level monthly growth report. Write a query to calculate the total revenue (amount) broken down by month. Group the dates so that all orders from February appear together, all orders from March appear together, etc.
SELECT 
    DATE_TRUNC('month', order_date)::DATE AS sales_month,
    SUM(amount) AS total_monthly_revenue
FROM orders
GROUP BY DATE_TRUNC('month', order_date)
ORDER BY sales_month;
--The operations team wants to know which day of the week sees the highest transaction activity. Write a query to extract the day of the week from your order_date and count how many orders were placed on that specific day of the week.
SELECT 
    EXTRACT(DOW FROM order_date) AS day_of_week,
    COUNT(*) AS total_orders
FROM orders
GROUP BY EXTRACT(DOW FROM order_date)
ORDER BY day_of_week;
--Imagine we want to see how long our table has been collecting data. Write a query that finds the total number of days elapsed between the very first order date and the very last order date present in your dataset.
SELECT 
    MAX(order_date) - MIN(order_date) AS total_days_tracked
FROM orders;