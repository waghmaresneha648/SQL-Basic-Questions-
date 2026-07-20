-- =======================================================
-- 1. DATABASE SETUP
-- =======================================================
CREATE DATABASE IF NOT EXISTS OnlineStore;
USE OnlineStore;

-- Clean up existing tables if re-running
DROP TABLE IF EXISTS OrderDetails;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Customers;

-- =======================================================
-- 2. CREATE TABLES (SCHEMA DESIGN)
-- =======================================================

-- Table 1: Customers
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    city VARCHAR(50) NOT NULL
);

-- Table 2: Products
CREATE TABLE Products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT DEFAULT 0
);

-- Table 3: Orders
CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id) ON DELETE CASCADE
);

-- Table 4: Order Details (Junction Table for Products & Orders)
CREATE TABLE OrderDetails (
    order_detail_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    unit_price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES Products(product_id) ON DELETE CASCADE
);

-- =======================================================
-- 3. INSERT SAMPLE DATA
-- =======================================================

INSERT INTO Customers (first_name, last_name, email, city) VALUES
('Alex', 'Mercer', 'alex.m@email.com', 'New York'),
('Sarah', 'Connor', 'sarah.c@email.com', 'Los Angeles'),
('David', 'Beck', 'david.b@email.com', 'Chicago'),
('Elena', 'Rostova', 'elena.r@email.com', 'Seattle');

INSERT INTO Products (product_name, category, price, stock_quantity) VALUES
('Wireless Mouse', 'Electronics', 25.50, 100),
('Mechanical Keyboard', 'Electronics', 85.00, 45),
('Coffee Mug', 'Home & Kitchen', 12.00, 200),
('Noise-Canceling Headphones', 'Electronics', 150.00, 30),
('Desk Lamp', 'Home & Kitchen', 35.00, 60);

INSERT INTO Orders (customer_id, order_date) VALUES
(1, '2026-06-01'),
(2, '2026-06-03'),
(1, '2026-06-10'),
(3, '2026-06-15');

INSERT INTO OrderDetails (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 2, 25.50),  -- Alex bought 2 Wireless Mice
(1, 3, 1, 12.00),  -- Alex bought 1 Coffee Mug
(2, 4, 1, 150.00), -- Sarah bought 1 Headphones
(3, 2, 1, 85.00),  -- Alex bought 1 Keyboard
(4, 5, 2, 35.00);  -- David bought 2 Desk Lamps

-- =======================================================
-- 4. ANALYTICAL QUERIES (BUSINESS INSIGHTS)
-- =======================================================

-- Query 1: Total Spending per Customer (using INNER JOIN & Aggregation)
SELECT 
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    c.email,
    SUM(od.quantity * od.unit_price) AS total_spent
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN OrderDetails od ON o.order_id = od.order_id
GROUP BY c.customer_id, customer_name, c.email
ORDER BY total_spent DESC;

-- Query 2: Sales Summary by Product Category
SELECT 
    p.category,
    SUM(od.quantity) AS total_items_sold,
    SUM(od.quantity * od.unit_price) AS category_revenue
FROM Products p
JOIN OrderDetails od ON p.product_id = od.product_id
GROUP BY p.category;

-- Query 3: Customers with No Orders Yet (using LEFT JOIN)
SELECT 
    c.first_name, 
    c.last_name, 
    c.email
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;