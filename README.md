# SQL-Ecommerce-Data-Analysis-Olist

# SQL E-Commerce Data Analysis Project – Olist

This project is part of my Data Analyst Internship task where I performed SQL-based data analysis on a real-world E-commerce dataset (Olist) using MySQL.

---

## Dataset

Brazilian E-commerce Public Dataset by Olist, containing 9 relational tables:

- Customers  
- Orders  
- Order Items  
- Products  
- Sellers  
- Payments  
- Reviews  
- Geolocation  
- Category Translation

---

## Project Objectives

- Load and clean 9 CSV files using SQL
- Explore data using `JOIN`, `GROUP BY`, `ORDER BY`
- Derive business insights using `aggregate functions`, `subqueries`, and `views`
- Optimize performance using indexes

---

## Key Insights

### Top Selling Products

We created a view to identify best-selling products based on quantity and revenue.

```sql
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
