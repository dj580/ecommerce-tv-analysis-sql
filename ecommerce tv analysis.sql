-- Create and select the database
CREATE DATABASE ecommerce;
USE ecommerce;

--  Create the products table
CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    brand VARCHAR(50),
    resolution VARCHAR(50),
    size VARCHAR(20),
    selling_price DECIMAL(10,2),
    original_price DECIMAL(10,2),
    operating_system VARCHAR(50),
    rating DECIMAL(3,1)
);

-- Retrieve the first 10 rows from the products table
SELECT * FROM products LIMIT 10;

-- Retrieve all rows and columns from the products table
SELECT * FROM products;

-- Select products where the rating is greater than 4.0
SELECT * FROM products
WHERE rating > 4.0;

-- Retrieve the top 5 products with the highest selling price
SELECT * FROM products
ORDER BY selling_price DESC
LIMIT 5;

-- Count how many products are available for each operating system
SELECT operating_system, COUNT(*) AS product_count
FROM products
GROUP BY operating_system;

-- Calculate the average rating of products for each brand
SELECT brand, AVG(rating) AS avg_rating
FROM products
GROUP BY brand;

-- Create a view to store all products with a rating of 4.5 or higher
CREATE VIEW high_rated_products AS
SELECT * FROM products
WHERE rating >= 4.5;

-- Retrieve data from the created view
SELECT * FROM high_rated_products;


-- create a table categories
CREATE TABLE categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    brand VARCHAR(50),
    category_name VARCHAR(50)
);

-- Inserting Brand-Category Mappings into `categories` Table
INSERT INTO categories (brand, category_name) VALUES
('Samsung', 'LED TV'),
('LG', 'OLED TV'),
('Sony', 'Smart TV'),
('Panasonic', 'LED TV'),
('Mi', 'Android TV'),
('IMPEX', 'QLED TV'),
('TCL', 'Smart TV');

--  INNER JOIN Between `products` and `categories` Tables
SELECT p.brand, p.size, p.selling_price, c.category_name
FROM products p
INNER JOIN categories c ON p.brand = c.brand;

--  LEFT JOIN Between `products` and `categories` Tables
SELECT p.brand, p.size, p.selling_price, c.category_name
FROM products p
LEFT JOIN categories c ON p.brand = c.brand;

--  RIGHT JOIN Between `products` and `categories` Tables
SELECT p.brand, p.size, p.selling_price, c.category_name
FROM products p
RIGHT JOIN categories c ON p.brand = c.brand;

-- Products with Selling Price Above the Average
SELECT *
FROM products
WHERE selling_price > (
    SELECT AVG(selling_price) FROM products
);

 --  Total Revenue from All Products
SELECT SUM(selling_price) AS total_revenue FROM products;

-- Create Index on Brand for Faster Search
CREATE INDEX idx_brand ON products(brand);

--  Get all unique brand names
SELECT DISTINCT brand FROM products;

-- Total Original Price Grouped by Brand
SELECT brand, SUM(original_price) AS total_original_price
FROM products
GROUP BY brand;



