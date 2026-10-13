# Practical-exam

🛒 E-Commerce Order Management System (MySQL)

📌 Project Overview

The E-Commerce Order Management System is a database project built using MySQL. It helps an administrator manage products, categories, customers, orders, order items, payments, and shipping details. The database is designed to support common e-commerce operations and sales analysis using SQL queries.

🎯 Objectives

Manage products and product categories.

Store customer details and registration information.

Create and track orders.

Maintain order items, quantities, and subtotals.

Track payment and shipping information.

Analyze sales, revenue, and customer spending.

Practise CRUD operations, joins, filtering, sorting, aggregation, subqueries, and SQL functions.

🗂️ Database Schema

The database is organized into related tables:

Table

Purpose

Categories

Stores product category names.

Products

Stores product details, prices, stock quantities, and category references.

Customers

Stores customer contact and address information.

Orders

Stores order dates, total amounts, customer references, and order statuses.

Order_Items

Stores the products included in each order, their quantities, and subtotals.

Payments

Stores payment details and payment status.

Shipping

Stores shipping and delivery details.

Main Relationships

One category can contain many products.

One customer can place many orders.

One order can contain multiple order items.

Each order item references a product.

Orders are linked with payment and shipping records where applicable.

🧰 Technologies Used

Database: MySQL

Language: SQL

Tools: MySQL Command Line Client / MySQL Workbench (whichever is used)

⚙️ Core Features

Product & Category Management: Add, update, delete, and search products and categories.

Customer Management: Store customer details and review order history.

Order Management: Place orders, view order details, track status, and handle cancellations.

Payment Tracking: Maintain payment information and payment status.

Shipping Management: Track shipping details and delivery status.

Sales Analysis: Find best-selling products, total revenue, and customer spending.

🧠 SQL Concepts Practised

DDL: CREATE, ALTER, DROP

DML: INSERT, UPDATE, DELETE

DQL: SELECT

Filtering and sorting: WHERE, ORDER BY, LIMIT

Aggregate functions: COUNT(), SUM(), AVG(), MIN(), MAX()

Joins: INNER JOIN, LEFT JOIN

Subqueries

String and date functions

GROUP BY and HAVING

Primary keys and foreign keys

Data integrity and table relationships

🚀 Setup Instructions

Open MySQL Command Line Client or MySQL Workbench.

Create and select a database:

CREATE DATABASE ecommerce_db;
USE ecommerce_db;

Create the tables according to the project schema:
Categories, Products, Customers, Orders, Order_Items, Payments, and Shipping.

Insert sample records into the tables.

Run your SQL queries to test CRUD operations, relationships, and sales reports.

Note: If your database or table names differ from the names in this README, update the commands to match your actual SQL script.

📊 Example Analysis Queries

1. Total Revenue

SELECT SUM(total_amount) AS total_revenue
FROM Orders
WHERE status IN ('Shipped', 'Delivered');

2. Best-Selling Products

SELECT p.product_id, p.name, SUM(oi.quantity) AS units_sold
FROM Products AS p
JOIN Order_Items AS oi
    ON p.product_id = oi.product_id
GROUP BY p.product_id, p.name
ORDER BY units_sold DESC;

3. Customer Order History

SELECT c.customer_id, c.name, o.order_id, o.order_date, o.total_amount, o.status
FROM Customers AS c
JOIN Orders AS o
    ON c.customer_id = o.customer_id
ORDER BY c.customer_id, o.order_date DESC;

📁 Suggested Project Structure

E-Commerce-Order-Management-System/
├── README.md
├── ecommerce_db.sql
└── screenshots/
    ├── tables.png
    └── query-output.png

👩‍💻 Author

Vaibhavi Khokhani
BCA Graduate | Python & AI Fresher
