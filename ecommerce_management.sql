create database ecommerce;

Query OK, 1 row affected

use ecommerce;

Database changed

create table products(
    product_id int primary key,
    name varchar(50),
    category_id int, 
    price decimal (10,2),
    stock_quantity int,
    added_date DATE,
    foreign key(category_id) REFERENCES categories(category_id)
);

Query OK, 0 rows affected

create table categories(
    category_id int primary key,
    category_name varchar(50)
);
Query OK, 0 rows affected

create table customers(
    customer_id int primary key,
    name varchar(50),
    email varchar(100),
    phone_number varchar(50),
    address varchar(50),
    registration_date DATE
);

Query OK, 0 rows affected

create table orders(
    order_id int primary key,
    customer_id int,
    order_date DATE,
    total_amount decimal(10,2),
    status varchar(20),
    foreign key (customer_id)
    REFERENCES customers(customer_id)
);

Query OK, 0 rows affected

create table order_item(
    order_item_id int primary key,
    order_id int,
    product_id int,
    quantity int,
    subtotal decimal(10,2),
    foreign key (order_id)
    REFERENCES orders(order_id),
    foreign key (product_id)
    REFERENCES products(product_id)
);

Query OK, 0 rows affected

create table payments(
    payment_id int primary key,
    order_id int,
    payment_date DATE,
    payment_method varchar(50),
    payment_status varchar(50),
    foreign key (order_id)
    REFERENCES orders(order_id)
);
Query OK, 0 rows affected


create table shipping(
    shipping_id int primary key,
    order_id int,
    shipping_date DATE,
    delivery_date DATE,
    shipping_status varchar(50),
    foreign key (order_id)
    REFERENCES orders(order_id)
);
Query OK, 0 rows affected

--- 1.crud operation

insert into products (product_id,name,category_id,price,stock_quantity,added_date)
values(1,'laptop',101,50000,10,'2026-10-13'),
(2,'table',102,57000,15,'2026-10-12'),
(3,'t-shirt',103,45000,20,'2026-10-11'),
(4,'gence',104,49000,20,'2026-10-10'),
(5,'mobile',105,46000,20,'2026-10-09');

Query OK, 5 rows affected (0.158 sec)
Records: 5  Duplicates: 0  Warnings: 0

select * from products;
+------------+---------+-------------+----------+----------------+------------+
| product_id | name    | category_id | price    | stock_quantity | added_date |
+------------+---------+-------------+----------+----------------+------------+
|          1 | laptop  |         101 | 50000.00 |             10 | 2026-10-13 |
|          2 | table   |         102 | 57000.00 |             15 | 2026-10-12 |
|          3 | t-shirt |         103 | 45000.00 |             20 | 2026-10-11 |
|          4 | gence   |         104 | 49000.00 |             20 | 2026-10-10 |
|          5 | mobile  |         105 | 46000.00 |             20 | 2026-10-09 |
+------------+---------+-------------+----------+----------------+------------+
5 rows in set (0.057 sec)

insert into categories (category_id,category_name)
values(101,'Electronics'),
(102,'furniture'),
(103,'clothing'),
(104,'colthing'),
(105,'Electronics');

Query OK, 5 rows affected (0.857 sec)
Records: 5  Duplicates: 0  Warnings: 0

select * from categories;
+-------------+---------------+
| category_id | category_name |
+-------------+---------------+
|         101 | Electronics   |
|         102 | furniture     |
|         103 | clothing      |
|         104 | colthing      |
|         105 | Electronics   |
+-------------+---------------+
5 rows in set (0.088 sec)

insert into customers(customer_id,name,email,phone_number,address,registration_date)
values(1,'vaibhavi','vk@gmail.com','9876543210','amreli','2026-10-13'),
(2,'prinsa','pm@gmail.com','5689741236','varudi','2026-10-12'),
(3,'dhuli','dr@gmail.com','9904310587','surat','2026-10-11'),
(4,'janu','jm@gmail.com','9875623870','rajkot','2026-10-10'),
(5,'sinu','is@gmail.com','9925403671','mumbai','2026-10-09');

Query OK, 5 rows affected (0.377 sec)
Records: 5  Duplicates: 0  Warnings: 0

select * from customers;

+-------------+----------+--------------+--------------+---------+-------------------+
| customer_id | name     | email        | phone_number | address | registration_date |
+-------------+----------+--------------+--------------+---------+-------------------+
|           1 | vaibhavi | vk@gmail.com | 9876543210   | amreli  | 2026-10-13        |
|           2 | prinsa   | pm@gmail.com | 5689741236   | varudi  | 2026-10-12        |
|           3 | dhuli    | dr@gmail.com | 9904310587   | surat   | 2026-10-11        |
|           4 | janu     | jm@gmail.com | 9875623870   | rajkot  | 2026-10-10        |
|           5 | sinu     | is@gmail.com | 9925403671   | mumbai  | 2026-10-09        |
+-------------+----------+--------------+--------------+---------+-------------------+
5 rows in set (0.030 sec)


insert into orders(order_id,customer_id,order_date,total_amount,status)
values(101,1,'2026-10-13',50000,'pending'),
(102,2,'2026-10-12',57000,'shipped'),
(103,3,'2026-10-11',45000,'delivered'),
(104,4,'2026-10-10',30000,'pending'),
(105,5,'2026-10-09',35000,'shipped');

Query OK, 5 rows affected (0.245 sec)
Records: 5  Duplicates: 0  Warnings: 0

select * from orders;

+----------+-------------+------------+--------------+-----------+
| order_id | customer_id | order_date | total_amount | status    |
+----------+-------------+------------+--------------+-----------+
|      101 |           1 | 2026-10-13 |     50000.00 | pending   |
|      102 |           2 | 2026-10-12 |     57000.00 | shipped   |
|      103 |           3 | 2026-10-11 |     45000.00 | delivered |
|      104 |           4 | 2026-10-10 |     30000.00 | pending   |
|      105 |           5 | 2026-10-09 |     35000.00 | shipped   |
+----------+-------------+------------+--------------+-----------+
5 rows in set (0.013 sec)

insert into order_item(order_item_id,order_id,product_id,quantity,subtotal)
values
(1,101,1,2,1000.00),
(2,102,2,1,500.00),
(3,103,3,3,1500.00),
(4,104,4,1,500.00),
(5,105,5,2,1000.00);

Query OK, 5 rows affected (0.279 sec)
Records: 5  Duplicates: 0  Warnings: 0

select * from order_item;
+---------------+----------+------------+----------+----------+
| order_item_id | order_id | product_id | quantity | subtotal |
+---------------+----------+------------+----------+----------+
|             1 |      101 |          1 |        2 |  1000.00 |
|             2 |      102 |          2 |        1 |   500.00 |
|             3 |      103 |          3 |        3 |  1500.00 |
|             4 |      104 |          4 |        1 |   500.00 |
|             5 |      105 |          5 |        2 |  1000.00 |
+---------------+----------+------------+----------+----------+
5 rows in set (0.012 sec)


insert into payments(payment_id,order_id,payment_date,payment_method,payment_status)
values
(1,101,'2026-10-13','UPI','completed'),
(2,102,'2026-10-12','card','pending'),
(3,103,'2026-10-11','cash','completed'),
(4,104,'2026-10-10','check','pending'),
(5,105,'2026-10-09','UPI','completed');

Query OK, 5 rows affected (0.178 sec)
Records: 5  Duplicates: 0  Warnings: 0

select * from payments;
+------------+----------+--------------+----------------+----------------+
| payment_id | order_id | payment_date | payment_method | payment_status |
+------------+----------+--------------+----------------+----------------+
|          1 |      101 | 2026-10-13   | UPI            | completed      |
|          2 |      102 | 2026-10-12   | card           | pending        |
|          3 |      103 | 2026-10-11   | cash           | completed      |
|          4 |      104 | 2026-10-10   | check          | pending        |
|          5 |      105 | 2026-10-09   | UPI            | completed      |
+------------+----------+--------------+----------------+----------------+
5 rows in set (0.020 sec)


insert into shipping(shipping_id,order_id,shipping_date,delivery_date,shipping_status)
values
(1,101,'2026-10-13',NULL,'pending'),
(2,102,'2026-10-12',NULL,'shipped'),
(3,103,'2026-10-11','2026-10-13','delivered'),
(4,104,'2026-10-10',NULL,'pending'),
(5,105,'2026-10-09',NULL,'pending');

Query OK, 5 rows affected (0.175 sec)
Records: 5  Duplicates: 0  Warnings: 0

select * from shipping;
+-------------+----------+---------------+---------------+-----------------+
| shipping_id | order_id | shipping_date | delivery_date | shipping_status |
+-------------+----------+---------------+---------------+-----------------+
|           1 |      101 | 2026-10-13    | NULL          | pending         |
|           2 |      102 | 2026-10-12    | NULL          | shipped         |
|           3 |      103 | 2026-10-11    | 2026-10-13    | delivered       |
|           4 |      104 | 2026-10-10    | NULL          | pending         |
|           5 |      105 | 2026-10-09    | NULL          | pending         |
+-------------+----------+---------------+---------------+-----------------+
5 rows in set (0.017 sec)

--- 2.
USE ecommerce;

DELIMITER //

CREATE TRIGGER update_stock_after_order
AFTER INSERT ON order_item
FOR EACH ROW
BEGIN
    UPDATE products
    SET stock_quantity = stock_quantity - NEW.quantity
    WHERE product_id = NEW.product_id;
END //

DELIMITER ;

+------------+---------+-------------+----------+----------------+------------+
| product_id | name    | category_id | price    | stock_quantity | added_date |
+------------+---------+-------------+----------+----------------+------------+
|          1 | laptop  |         101 | 50000.00 |             10 | 2026-10-13 |
|          2 | table   |         102 | 57000.00 |             15 | 2026-10-12 |
|          3 | t-shirt |         103 | 45000.00 |             20 | 2026-10-11 |
|          4 | gence   |         104 | 49000.00 |             20 | 2026-10-10 |
|          5 | mobile  |         105 | 46000.00 |             20 | 2026-10-09 |
+------------+---------+-------------+----------+----------------+------------+
5 rows in set (0.020 sec)

--- 3.

DELETE FROM orders
WHERE status = 'cancelled'
AND order_date < DATE_SUB(CURDATE(), INTERVAL 30 DAY);

Query OK, 0 rows affected (0.302 sec)

+----------+-------------+------------+--------------+-----------+
| order_id | customer_id | order_date | total_amount | status    |
+----------+-------------+------------+--------------+-----------+
|      101 |           1 | 2026-10-13 |     50000.00 | pending   |
|      102 |           2 | 2026-10-12 |     57000.00 | shipped   |
|      103 |           3 | 2026-10-11 |     45000.00 | delivered |
|      104 |           4 | 2026-10-10 |     30000.00 | pending   |
|      105 |           5 | 2026-10-09 |     35000.00 | shipped   |
+----------+-------------+------------+--------------+-----------+
5 rows in set

--- 2 sql clause

---1.

SELECT *
FROM orders
WHERE order_date >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH)
  AND order_date <= CURDATE();

+----------+-------------+------------+--------------+-----------+
| order_id | customer_id | order_date | total_amount | status    |
+----------+-------------+------------+--------------+-----------+
|      101 |           1 | 2026-10-13 |     50000.00 | pending   |
|      102 |           2 | 2026-10-12 |     57000.00 | shipped   |
|      103 |           3 | 2026-10-11 |     45000.00 | delivered |
|      104 |           4 | 2026-10-10 |     30000.00 | pending   |
|      105 |           5 | 2026-10-09 |     35000.00 | shipped   |
+----------+-------------+------------+--------------+-----------+
5 rows in set (0.126 sec)

---2.

SELECT *
FROM products
ORDER BY price DESC
LIMIT 5;
+------------+---------+-------------+----------+----------------+------------+
| product_id | name    | category_id | price    | stock_quantity | added_date |
+------------+---------+-------------+----------+----------------+------------+
|          2 | table   |         102 | 57000.00 |             15 | 2026-10-12 |
|          1 | laptop  |         101 | 50000.00 |             10 | 2026-10-13 |
|          4 | gence   |         104 | 49000.00 |             20 | 2026-10-10 |
|          5 | mobile  |         105 | 46000.00 |             20 | 2026-10-09 |
|          3 | t-shirt |         103 | 45000.00 |             20 | 2026-10-11 |
+------------+---------+-------------+----------+----------------+------------+
5 rows in set (0.179 sec)


---3.

SELECT
    c.customer_id,
    c.name,
    COUNT(o.order_id) AS total_orders
FROM customers AS c
JOIN orders AS o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
HAVING COUNT(o.order_id) < 3;

+-------------+----------+--------------+
| customer_id | name     | total_orders |
+-------------+----------+--------------+
|           1 | vaibhavi |            1 |
|           2 | prinsa   |            1 |
|           3 | dhuli    |            1 |
|           4 | janu     |            1 |
|           5 | sinu     |            1 |
+-------------+----------+--------------+
5 rows in set (0.016 sec)

--- 3. sql operator
---1.

SELECT o.*
FROM orders AS o
JOIN payments AS p
    ON o.order_id = p.order_id
WHERE o.status = 'pending'
AND p.payment_status = 'paid';

+----------+-------------+------------+--------------+---------+
| order_id | customer_id | order_date | total_amount | status  |
+----------+-------------+------------+--------------+---------+
|      101 |           1 | 2026-10-13 |     50000.00 | pending |
+----------+-------------+------------+--------------+---------+
1 row in set (0.013 sec)

---2.
SELECT *
FROM products
WHERE NOT stock_quantity = 0;

+------------+---------+-------------+----------+----------------+------------+
| product_id | name    | category_id | price    | stock_quantity | added_date |
+------------+---------+-------------+----------+----------------+------------+
|          1 | laptop  |         101 | 50000.00 |             10 | 2026-10-13 |
|          2 | table   |         102 | 57000.00 |             15 | 2026-10-12 |
|          3 | t-shirt |         103 | 45000.00 |             20 | 2026-10-11 |
|          4 | gence   |         104 | 49000.00 |             20 | 2026-10-10 |
|          5 | mobile  |         105 | 46000.00 |             20 | 2026-10-09 |
+------------+---------+-------------+----------+----------------+------------+
5 rows in set (0.056 sec)

--- or

SELECT *
FROM products
WHERE stock_quantity > 0;

---3.

SELECT DISTINCT c.*
FROM customers AS c
LEFT JOIN orders AS o
    ON c.customer_id = o.customer_id
WHERE c.registration_date >= '2023-01-01'
OR o.total_amount > 10000;

+-------------+----------+--------------+--------------+---------+-------------------+
| customer_id | name     | email        | phone_number | address | registration_date |
+-------------+----------+--------------+--------------+---------+-------------------+
|           1 | vaibhavi | vk@gmail.com | 9876543210   | amreli  | 2026-10-13        |
|           2 | prinsa   | pm@gmail.com | 5689741236   | varudi  | 2026-10-12        |
|           3 | dhuli    | dr@gmail.com | 9904310587   | surat   | 2026-10-11        |
|           4 | janu     | jm@gmail.com | 9875623870   | rajkot  | 2026-10-10        |
|           5 | sinu     | is@gmail.com | 9925403671   | mumbai  | 2026-10-09        |
+-------------+----------+--------------+--------------+---------+-------------------+
5 rows in set (0.273 sec)

---4.sorting and grouping data

---1.

SELECT *
FROM products
ORDER BY price DESC;

+------------+---------+-------------+----------+----------------+------------+
| product_id | name    | category_id | price    | stock_quantity | added_date |
+------------+---------+-------------+----------+----------------+------------+
|          2 | table   |         102 | 57000.00 |             15 | 2026-10-12 |
|          1 | laptop  |         101 | 50000.00 |             10 | 2026-10-13 |
|          4 | gence   |         104 | 49000.00 |             20 | 2026-10-10 |
|          5 | mobile  |         105 | 46000.00 |             20 | 2026-10-09 |
|          3 | t-shirt |         103 | 45000.00 |             20 | 2026-10-11 |
+------------+---------+-------------+----------+----------------+------------+
5 rows in set (0.012 sec)


---2.

SELECT
    c.customer_id,
    c.name,
    COUNT(o.order_id) AS total_orders
FROM customers AS c
LEFT JOIN orders AS o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name;

+-------------+----------+--------------+
| customer_id | name     | total_orders |
+-------------+----------+--------------+
|           1 | vaibhavi |            1 |
|           2 | prinsa   |            1 |
|           3 | dhuli    |            1 |
|           4 | janu     |            1 |
|           5 | sinu     |            1 |
+-------------+----------+--------------+
5 rows in set
---3.

SELECT
    c.category_id,
    c.category_name,
    SUM(oi.subtotal) AS total_revenue
FROM categories AS c
JOIN products AS p
    ON c.category_id = p.category_id
JOIN order_item AS oi
    ON p.product_id = oi.product_id
JOIN orders AS o
    ON oi.order_id = o.order_id
WHERE o.status <> 'cancelled'
GROUP BY c.category_id, c.category_name
ORDER BY total_revenue DESC;

+-------------+---------------+---------------+
| category_id | category_name | total_revenue |
+-------------+---------------+---------------+
|         103 | clothing      |       1500.00 |
|         101 | Electronics   |       1000.00 |
|         105 | Electronics   |       1000.00 |
|         102 | furniture     |        500.00 |
|         104 | colthing      |        500.00 |
+-------------+---------------+---------------+
5 rows in set (0.117 sec)

--- 5 aggregation function
---1.

SELECT SUM(total_amount) AS total_revenue
FROM orders
WHERE status <> 'cancelled';

+---------------+
| total_revenue |
+---------------+
|     217000.00 |
+---------------+
1 row in set

---2.

SELECT
    p.product_id,
    p.name,
    SUM(oi.quantity) AS total_purchased
FROM products AS p
JOIN order_item AS oi
    ON p.product_id = oi.product_id
JOIN orders AS o
    ON oi.order_id = o.order_id
WHERE o.status <> 'cancelled'
GROUP BY p.product_id, p.name
ORDER BY total_purchased DESC
LIMIT 1;
+------------+---------+-----------------+
| product_id | name    | total_purchased |
+------------+---------+-----------------+
|          3 | t-shirt |               3 |
+------------+---------+-----------------+
1 row in set (0.048 sec)

---3.

SELECT AVG(total_amount) AS average_order_value
FROM orders
WHERE status <> 'cancelled';

+---------------------+
| average_order_value |
+---------------------+
|        43400.000000 |
+---------------------+
1 row in set (0.094 sec)


---6 relation primary key & foreign key

---1.
ALTER TABLE orders
ADD CONSTRAINT fk_orders_customers
FOREIGN KEY (customer_id)
REFERENCES customers(customer_id);

Query OK, 5 rows affected (4.634 sec)
Records: 5  Duplicates: 0  Warnings: 0

ALTER TABLE order_item
ADD CONSTRAINT fk_order_item_orders
FOREIGN KEY (order_id)
REFERENCES orders(order_id);

Query OK, 5 rows affected (2.416 sec)
Records: 5  Duplicates: 0  Warnings: 0

ALTER TABLE order_item
ADD CONSTRAINT fk_order_item_products
FOREIGN KEY (product_id)
REFERENCES products(product_id);

Query OK, 5 rows affected (2.416 sec)
Records: 5  Duplicates: 0  Warnings: 0

---2.
ALTER TABLE payments
ADD CONSTRAINT fk_payments_orders
FOREIGN KEY (order_id)
REFERENCES orders(order_id);

Query OK, 5 rows affected (2.416 sec)
Records: 5  Duplicates: 0  Warnings: 0

---7. sql join
---1.
SELECT
    p.product_id,
    p.name AS product_name,
    c.category_name,
    p.price
FROM products AS p
INNER JOIN categories AS c
    ON p.category_id = c.category_id;
------------+--------------+---------------+----------+
| product_id | product_name | category_name | price    |
+------------+--------------+---------------+----------+
|          1 | laptop       | Electronics   | 50000.00 |
|          2 | table        | furniture     | 57000.00 |
|          3 | t-shirt      | clothing      | 45000.00 |
|          4 | gence        | colthing      | 49000.00 |
|          5 | mobile       | Electronics   | 46000.00 |
+------------+--------------+---------------+----------+
5 rows in set (0.087 sec)

---2.
SELECT
    o.order_id,
    o.order_date,
    o.total_amount,
    o.status,
    c.customer_id,
    c.name AS customer_name,
    c.email,
    c.phone_number
FROM orders AS o
LEFT JOIN customers AS c
    ON o.customer_id = c.customer_id;

+----------+------------+--------------+-----------+-------------+---------------+--------------+--------------+
| order_id | order_date | total_amount | status    | customer_id | customer_name | email        | phone_number |
+----------+------------+--------------+-----------+-------------+---------------+--------------+--------------+
|      101 | 2026-10-13 |     50000.00 | pending   |           1 | vaibhavi      | vk@gmail.com | 9876543210   |
|      102 | 2026-10-12 |     57000.00 | shipped   |           2 | prinsa        | pm@gmail.com | 5689741236   |
|      103 | 2026-10-11 |     45000.00 | delivered |           3 | dhuli         | dr@gmail.com | 9904310587   |
|      104 | 2026-10-10 |     30000.00 | pending   |           4 | janu          | jm@gmail.com | 9875623870   |
|      105 | 2026-10-09 |     35000.00 | shipped   |           5 | sinu          | is@gmail.com | 9925403671   |
+----------+------------+--------------+-----------+-------------+---------------+--------------+--------------+
5 rows in set (0.124 sec)

--- 3.
SELECT
    o.order_id,
    o.customer_id,
    o.order_date,
    o.status,
    s.shipping_status
FROM shipping AS s
RIGHT JOIN orders AS o
    ON s.order_id = o.order_id
WHERE s.order_id IS NULL
   OR s.shipping_status <> 'shipped';

+----------+-------------+------------+-----------+-----------------+
| order_id | customer_id | order_date | status    | shipping_status |
+----------+-------------+------------+-----------+-----------------+
|      101 |           1 | 2026-10-13 | pending   | pending         |
|      103 |           3 | 2026-10-11 | delivered | delivered       |
|      104 |           4 | 2026-10-10 | pending   | pending         |
|      105 |           5 | 2026-10-09 | shipped   | pending         |
+----------+-------------+------------+-----------+-----------------+
4 rows in set

---4.
SELECT
    c.customer_id,
    c.name,
    c.email
FROM customers AS c
LEFT JOIN orders AS o
    ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

---8. sql subqueries

---1.
SELECT *
FROM orders
WHERE customer_id IN (
    SELECT customer_id
    FROM customers
    WHERE registration_date >= '2023-01-01'
);

---2.
SELECT
    customer_id,
    name,
    total_spent
FROM (
    SELECT
        c.customer_id,
        c.name,
        SUM(o.total_amount) AS total_spent
    FROM customers AS c
    INNER JOIN orders AS o
        ON c.customer_id = o.customer_id
    WHERE o.status <> 'cancelled'
    GROUP BY c.customer_id, c.name
) AS customer_spending
WHERE total_spent = (
    SELECT MAX(total_spent)
    FROM (
        SELECT
            customer_id,
            SUM(total_amount) AS total_spent
        FROM orders
        WHERE status <> 'cancelled'
        GROUP BY customer_id
    ) AS spending
);

+-------------+--------+-------------+
| customer_id | name   | total_spent |
+-------------+--------+-------------+
|           2 | prinsa |    57000.00 |
+-------------+--------+-------------+
1 row in set (0.106 sec)


---3.

SELECT
    p.product_id,
    p.name,
    p.price,
    p.stock_quantity
FROM products AS p
WHERE p.product_id NOT IN (
    SELECT product_id
    FROM order_item
);

---9. date & time function

---1.
SELECT
    MONTH(order_date) AS order_month,
    COUNT(order_id) AS total_orders
FROM orders
GROUP BY MONTH(order_date)
ORDER BY order_month;

+-------------+--------------+
| order_month | total_orders |
+-------------+--------------+
|          10 |            5 |
+-------------+--------------+
1 row in set (0.059 sec)

---2.

SELECT
    shipping_id,
    order_id,
    shipping_date,
    delivery_date,
    DATEDIFF(delivery_date, shipping_date) AS delivery_days
FROM shipping
WHERE shipping_date IS NOT NULL
  AND delivery_date IS NOT NULL;

+-------------+----------+---------------+---------------+---------------+
| shipping_id | order_id | shipping_date | delivery_date | delivery_days |
+-------------+----------+---------------+---------------+---------------+
|           3 |      103 | 2026-10-11    | 2026-10-13    |             2 |
+-------------+----------+---------------+---------------+---------------+
1 row in set (0.142 sec)

---3.

SELECT
    order_id,
    DATE_FORMAT(order_date, '%d-%m-%Y') AS formatted_order_date
FROM orders;

+----------+----------------------+
| order_id | formatted_order_date |
+----------+----------------------+
|      101 | 13-10-2026           |
|      102 | 12-10-2026           |
|      103 | 11-10-2026           |
|      104 | 10-10-2026           |
|      105 | 09-10-2026           |
+----------+----------------------+
5 rows in set (0.084 sec)

---10.string manipulation

---1.
SELECT
    product_id,
    UPPER(name) AS uppercase_product_name
FROM products;

+------------+------------------------+
| product_id | uppercase_product_name |
+------------+------------------------+
|          1 | LAPTOP                 |
|          2 | TABLE                  |
|          3 | T-SHIRT                |
|          4 | GENCE                  |
|          5 | MOBILE                 |
+------------+------------------------+
5 rows in set (0.030 sec)

---2.

SELECT
    customer_id,
    TRIM(name) AS trimmed_name
FROM customers;
+-------------+--------------+
| customer_id | trimmed_name |
+-------------+--------------+
|           1 | vaibhavi     |
|           2 | prinsa       |
|           3 | dhuli        |
|           4 | janu         |
|           5 | sinu         |
+-------------+--------------+
5 rows in set (0.018 sec)


---3.

SELECT
    customer_id,
    name,
    COALESCE(NULLIF(TRIM(email), ''), 'not provided') AS email
FROM customers;

    
+-------------+----------+--------------+
| customer_id | name     | email        |
+-------------+----------+--------------+
|           1 | vaibhavi | vk@gmail.com |
|           2 | prinsa   | pm@gmail.com |
|           3 | dhuli    | dr@gmail.com |
|           4 | janu     | jm@gmail.com |
|           5 | sinu     | is@gmail.com |
+-------------+----------+--------------+
5 rows in set
---11.windows function

---1.
SELECT
    customer_id,
    name,
    total_spending,
    RANK() OVER (ORDER BY total_spending DESC) AS spending_rank
FROM (
    SELECT
        c.customer_id,
        c.name,
        COALESCE(SUM(o.total_amount), 0) AS total_spending
    FROM customers AS c
    LEFT JOIN orders AS o
        ON c.customer_id = o.customer_id
        AND o.status <> 'cancelled'
    GROUP BY c.customer_id, c.name
) AS customer_totals;

+-------------+----------+----------------+---------------+
| customer_id | name     | total_spending | spending_rank |
+-------------+----------+----------------+---------------+
|           2 | prinsa   |       57000.00 |             1 |
|           1 | vaibhavi |       50000.00 |             2 |
|           3 | dhuli    |       45000.00 |             3 |
|           5 | sinu     |       35000.00 |             4 |
|           4 | janu     |       30000.00 |             5 |
+-------------+----------+----------------+---------------+
5 rows in set (0.095 sec)

---2.

SELECT
    order_month,
    monthly_revenue,
    SUM(monthly_revenue) OVER (
        ORDER BY order_month
    ) AS cumulative_revenue
FROM (
    SELECT
        DATE_FORMAT(order_date, '%Y-%m') AS order_month,
        SUM(total_amount) AS monthly_revenue
    FROM orders
    WHERE status <> 'cancelled'
    GROUP BY DATE_FORMAT(order_date, '%Y-%m')
) AS monthly_totals
ORDER BY order_month;

+-------------+-----------------+--------------------+
| order_month | monthly_revenue | cumulative_revenue |
+-------------+-----------------+--------------------+
| 2026-10     |       217000.00 |          217000.00 |
+-------------+-----------------+--------------------+
1 row in set
---3.

SELECT
    order_id,
    order_date,
    COUNT(*) OVER (
        ORDER BY order_date, order_id
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_total_orders
FROM orders
ORDER BY order_date, order_id;

+----------+------------+----------------------+
| order_id | order_date | running_total_orders |
+----------+------------+----------------------+
|      105 | 2026-10-09 |                    1 |
|      104 | 2026-10-10 |                    2 |
|      103 | 2026-10-11 |                    3 |
|      102 | 2026-10-12 |                    4 |
|      101 | 2026-10-13 |                    5 |
+----------+------------+----------------------+
5 rows in set (0.014 sec)

---12.

---1.
SELECT
    c.customer_id,
    c.name,
    COALESCE(SUM(o.total_amount), 0) AS total_spent,
    CASE
        WHEN COALESCE(SUM(o.total_amount), 0) > 50000 THEN 'Gold'
        WHEN COALESCE(SUM(o.total_amount), 0) BETWEEN 20000 AND 50000 THEN 'Silver'
        ELSE 'Bronze'
    END AS loyalty_status
FROM customers AS c
LEFT JOIN orders AS o
    ON c.customer_id = o.customer_id
    AND o.status <> 'cancelled'
GROUP BY c.customer_id, c.name;

+-------------+----------+-------------+----------------+
| customer_id | name     | total_spent | loyalty_status |
+-------------+----------+-------------+----------------+
|           1 | vaibhavi |    50000.00 | Silver         |
|           2 | prinsa   |    57000.00 | Gold           |
|           3 | dhuli    |    45000.00 | Silver         |
|           4 | janu     |    30000.00 | Silver         |
|           5 | sinu     |    35000.00 | Silver         |
+-------------+----------+-------------+----------------+
5 rows in set (0.036 sec)

---2.
SELECT
    p.product_id,
    p.name,
    COALESCE(SUM(oi.quantity), 0) AS total_sold,
    CASE
        WHEN COALESCE(SUM(oi.quantity), 0) > 500 THEN 'Best Seller'
        WHEN COALESCE(SUM(oi.quantity), 0) BETWEEN 200 AND 500 THEN 'Popular'
        ELSE 'Regular'
    END AS product_category
FROM products AS p
LEFT JOIN order_item AS oi
    ON p.product_id = oi.product_id
LEFT JOIN orders AS o
    ON oi.order_id = o.order_id
    AND o.status <> 'cancelled'
GROUP BY p.product_id, p.name;
+------------+---------+------------+------------------+
| product_id | name    | total_sold | product_category |
+------------+---------+------------+------------------+
|          1 | laptop  |          2 | Regular          |
|          2 | table   |          1 | Regular          |
|          3 | t-shirt |          3 | Regular          |
|          4 | gence   |          1 | Regular          |
|          5 | mobile  |          2 | Regular          |
+------------+---------+------------+------------------+
5 rows in set (0.018 sec)



