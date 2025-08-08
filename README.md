# 📺 TV Products SQL Analysis

This project involves SQL-based data analysis using a sample dataset of TV products. It demonstrates SQL skills such as table creation, data insertion, filtering, sorting, joins, subqueries, aggregate functions, views, and indexing using **MySQL Workbench**.

---

###  Tables Used

- **`products`** – Contains TV details (brand, resolution, size, prices, rating, etc.)
- **`categories`** – Maps brands to category types (e.g., Samsung → LED TV)

---

##  Key Features

-  Created and populated relational tables
-  Used `SELECT`, `WHERE`, `ORDER BY`, `GROUP BY`
-  Performed `INNER`, `LEFT`, `RIGHT` joins
-  Used subqueries and aggregate functions (`SUM`, `AVG`)
-  Created views for analytical purposes
-  Created indexes to optimize performance

---

##  Sample Queries

```sql
-- Get top 5 most expensive products
SELECT * FROM products
ORDER BY selling_price DESC
LIMIT 5;

-- Get average rating per brand
SELECT brand, AVG(rating) AS avg_rating
FROM products
GROUP BY brand;

-- View products with rating >= 4.5
CREATE VIEW high_rated_products AS
SELECT * FROM products
WHERE rating >= 4.5;

-- Join products with categories
SELECT p.brand, p.size, p.selling_price, c.category_name
FROM products p
INNER JOIN categories c ON p.brand = c.brand;
