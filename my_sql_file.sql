-- This script loads data from 9 CSV files into MySQL tables
-- Author: Kajal
-- Internship Task SQL Script




-- CREATE DATABASE olist_project;
USE olist_project;

-- 1. Create customers table
-- CREATE TABLE customers (
--   customer_id VARCHAR(50) PRIMARY KEY,
--   customer_unique_id VARCHAR(50),
--   customer_zip_code_prefix INT,
--   customer_city VARCHAR(100),
--   customer_state VARCHAR(10)
-- );

-- 2. Create geolocation table
-- CREATE TABLE geolocation (
--   geolocation_zip_code_prefix INT,
--   geolocation_lat FLOAT,
--   geolocation_lng FLOAT,
--   geolocation_city VARCHAR(100),
--   geolocation_state VARCHAR(10)
-- );

-- 3. Create order_items table
-- CREATE TABLE order_items (
--   order_id VARCHAR(50),
--   order_item_id INT,
--   product_id VARCHAR(50),
--   seller_id VARCHAR(50),
--   shipping_limit_date DATETIME,
--   price FLOAT,
--   freight_value FLOAT
-- );

-- 4. Create order_payments table
-- CREATE TABLE order_payments (
--   order_id VARCHAR(50),
--   payment_sequential INT,
--   payment_type VARCHAR(50),
--   payment_installments INT,
--   payment_value FLOAT
-- );

-- 5. Create order_reviews table
-- CREATE TABLE order_reviews (
--   review_id VARCHAR(50) PRIMARY KEY,
--   order_id VARCHAR(50),
--   review_score INT,
--   review_comment_title TEXT,
--   review_comment_message TEXT,
--   review_creation_date DATETIME,
--   review_answer_timestamp DATETIME
-- );

-- 6. Create oders table
-- CREATE TABLE orders (
--   order_id VARCHAR(50) PRIMARY KEY,
--   customer_id VARCHAR(50),
--   order_status VARCHAR(30),
--   order_purchase_timestamp DATETIME,
--   order_approved_at DATETIME,
--   order_delivered_carrier_date DATETIME,
--   order_delivered_customer_date DATETIME,
--   order_estimated_delivery_date DATETIME
-- );

-- 7. Create products table
-- CREATE TABLE products (
--   product_id VARCHAR(50) PRIMARY KEY,
--   product_category_name VARCHAR(100),
--   product_name_length INT,
--   product_description_length INT,
--   product_photos_qty INT,
--   product_weight_g INT,
--   product_length_cm INT,
--   product_height_cm INT,
--   product_width_cm INT
-- );

-- 8. Create sellers table
-- CREATE TABLE sellers (
--   seller_id VARCHAR(50) PRIMARY KEY,
--   seller_zip_code_prefix INT,
--   seller_city VARCHAR(100),
--   seller_state VARCHAR(10)
-- );

-- 9. Create product_category_translation table
-- CREATE TABLE product_category_translation (
--   product_category_name VARCHAR(100),
--   product_category_name_english VARCHAR(100)
-- );

-- SHOW VARIABLES LIKE 'local_infile';

-- SET GLOBAL local_infile = 1;

-- 1. Load customers data
-- LOAD DATA LOCAL INFILE "C:\\Users\\Kajal Prajapati\\Documents\\my_sql_dataset\\olist_customers_dataset.csv"
-- INTO TABLE customers
-- FIELDS TERMINATED BY ',' 
-- ENCLOSED BY '"'
-- LINES TERMINATED BY '\n'
-- IGNORE 1 ROWS;

-- 2. Load geolocation data
-- LOAD DATA LOCAL INFILE "C:\\Users\\Kajal Prajapati\\Documents\\my_sql_dataset\\olist_geolocation_dataset.csv"
-- INTO TABLE geolocation
-- FIELDS TERMINATED BY ',' 
-- ENCLOSED BY '"'
-- LINES TERMINATED BY '\n'
-- IGNORE 1 ROWS;

-- 3. Load order item data
-- LOAD DATA LOCAL INFILE "C:\\Users\\Kajal Prajapati\\Documents\\my_sql_dataset\\olist_order_items_dataset.csv"
-- INTO TABLE order_items
-- FIELDS TERMINATED BY ',' 
-- ENCLOSED BY '"'
-- LINES TERMINATED BY '\n'
-- IGNORE 1 ROWS;

-- 4. Load order payment data
-- LOAD DATA LOCAL INFILE "C:\\Users\\Kajal Prajapati\\Documents\\my_sql_dataset\\olist_order_payments_dataset.csv"
-- INTO TABLE order_payments
-- FIELDS TERMINATED BY ',' 
-- ENCLOSED BY '"'
-- LINES TERMINATED BY '\n'
-- IGNORE 1 ROWS;

-- 5. Load order reviews data
-- LOAD DATA LOCAL INFILE "C:\\Users\\Kajal Prajapati\\Documents\\my_sql_dataset\\olist_order_reviews_dataset.csv"
-- INTO TABLE order_reviews
-- FIELDS TERMINATED BY ',' 
-- ENCLOSED BY '"'
-- LINES TERMINATED BY '\n'
-- IGNORE 1 ROWS;

-- 6. Load orders data
-- LOAD DATA LOCAL INFILE "C:\\Users\\Kajal Prajapati\\Documents\\my_sql_dataset\\olist_orders_dataset.csv"
-- INTO TABLE orders
-- FIELDS TERMINATED BY ',' 
-- ENCLOSED BY '"'
-- LINES TERMINATED BY '\n'
-- IGNORE 1 ROWS;


-- 7. Load products data
-- LOAD DATA LOCAL INFILE "C:\\Users\\Kajal Prajapati\\Documents\\my_sql_dataset\\olist_products_dataset.csv"
-- INTO TABLE products
-- FIELDS TERMINATED BY ',' 
-- ENCLOSED BY '"'
-- LINES TERMINATED BY '\n'
-- IGNORE 1 ROWS;
-- SELECT COUNT(*) FROM products;

-- 8. Load sellers data
-- LOAD DATA LOCAL INFILE "C:\\Users\\Kajal Prajapati\\Documents\\my_sql_dataset\\olist_sellers_dataset.csv"
-- INTO TABLE sellers
-- FIELDS TERMINATED BY ',' 
-- ENCLOSED BY '"'
-- LINES TERMINATED BY '\n'
-- IGNORE 1 ROWS;

-- 9. Load product_category_name_translation data
-- LOAD DATA LOCAL INFILE "C:\\Users\\Kajal Prajapati\\Documents\\my_sql_dataset\\product_category_name_translation.csv"
-- INTO TABLE product_category_translation
-- FIELDS TERMINATED BY ',' 
-- ENCLOSED BY '"'
-- LINES TERMINATED BY '\n'
-- IGNORE 1 ROWS;

-- 1. Check customers table
SELECT * FROM customers LIMIT 10;

-- 2. Check geolocation table
SELECT * FROM geolocation LIMIT 10;

-- 3. Check order_items table
SELECT * FROM order_items LIMIT 10;

-- 4. Check order_payments table
SELECT * FROM order_payments LIMIT 10;

-- 5. Check order_reviews table
SELECT * FROM order_reviews LIMIT 10;

-- 6. Check orders table
SELECT * FROM orders LIMIT 10;

-- 7. Check products table
SELECT * FROM products LIMIT 10;

-- 8. Check sellers table
SELECT * FROM sellers LIMIT 10;

-- 9. Check product_category_translation table
SELECT * FROM product_category_translation LIMIT 10;

-- top 5 most common order statuses
SELECT order_status, COUNT(*) AS total_orders
FROM orders
GROUP BY order_status
ORDER BY total_orders DESC
LIMIT 5;

-- top selling articles
SELECT 
    p.product_category_name,
    oi.product_id,
    COUNT(*) AS total_sold
FROM 
    order_items oi
JOIN 
    products p ON oi.product_id = p.product_id
GROUP BY 
    oi.product_id, p.product_category_name
ORDER BY 
    total_sold DESC
LIMIT 10;


-- total transactions by payment_type
SELECT 
    payment_type, 
    COUNT(*) AS total_transactions
FROM 
    order_payments
GROUP BY 
    payment_type
ORDER BY 
    total_transactions DESC;


-- Total Revenue by Payment Type
SELECT 
    payment_type, 
    SUM(payment_value) AS total_revenue
FROM 
    order_payments
GROUP BY 
    payment_type
ORDER BY 
    total_revenue DESC;


-- Combine both insights
SELECT 
    payment_type, 
    COUNT(*) AS total_transactions,
    SUM(payment_value) AS total_revenue,
    ROUND(AVG(payment_value), 2) AS avg_payment
FROM 
    order_payments
GROUP BY 
    payment_type
ORDER BY 
    total_transactions DESC;

-- Top Selling Products View
CREATE VIEW top_selling_products_view AS
SELECT 
    p.product_category_name,
    oi.product_id,
    COUNT(*) AS total_sold,
    SUM(oi.price) AS total_revenue
FROM 
    order_items oi
JOIN 
    products p ON oi.product_id = p.product_id
GROUP BY 
    oi.product_id, p.product_category_name
ORDER BY 
    total_sold DESC;
    
SELECT * FROM top_selling_products_view LIMIT 10;

-- payment_summary_view
CREATE VIEW payment_summary_view AS
SELECT 
    payment_type, 
    COUNT(*) AS total_transactions,
    SUM(payment_value) AS total_revenue,
    ROUND(AVG(payment_value), 2) AS avg_payment
FROM 
    order_payments
GROUP BY 
    payment_type
ORDER BY 
    total_transactions DESC;

SELECT * FROM  payment_summary_view LIMIT 10;

-- Optimize Queries with Indexes
CREATE INDEX idx_order_status ON orders(order_status);
CREATE INDEX idx_product_id ON order_items(product_id);
CREATE INDEX idx_payment_type ON order_payments(payment_type);

SHOW INDEX FROM orders;
