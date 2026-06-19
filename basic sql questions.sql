SELECT * FROM orders;
--The marketing team wants a quick sample of our data. Write a query to view the first 3 rows of all columns from the orders table.
SELECT * FROM orders LIMIT 3;
--The finance team needs to audit high-value transactions. Write a query to find the order_id, user_id, and amount for all orders where the total amount spent is greater than 100.
SELECT order_id,user_id,amount FROM orders WHERE amount > 100;
--The operations team wants to track successful deliveries. Write a query to find all details of orders that have a status of 'Deliverd'.
SELECT * FROM orders WHERE status='Delivered';
--The sales manager wants to see a list of our highest-earning orders first so they can check in on VIP clients. Write a query to return all columns from orders, sorted by total_amount from highest to lowest.
SELECT * FROM orders ORDER BY amount  DESC;
--The operations team wants to identify high-priority orders that are currently stuck in the system. Write a query to find all orders where the status is 'Pending' AND the total_amount is greater than or equal to 100
SELECT * FROM orders WHERE status='pending'  AND amount>100;
--A shipping partner needs to extract data for specific customers. Write a query to find all details for orders placed by either customer 101, 103, or 104. (Try using the IN operator!)
SELECT * FROM orders WHERE order_id IN (101,102,103);