-- 			1. SELECT & WHERE Clause
-- 1.01 Select all records from the Customers table.
SELECT * FROM Customers;

-- 1.02 Select the first_name, last_name, and email of all customers.
SELECT first_name, last_name, email FROM Customers;

-- 1.03 Select all products with price > 500.
SELECT * FROM Products WHERE price > 500;

-- 1.04 Select all products in 'Electronics' category.
SELECT * FROM Products WHERE category = 'Electronics';

-- 1.05 Select product_name and price for products priced between 100 and 500.
SELECT product_name, price FROM Products WHERE price BETWEEN 100 AND 500;

-- 1.06 Select all products with stock_quantity < 50.
SELECT * FROM Products WHERE stock_quantity < 50;

-- 1.07 Select all customers who live in 'USA'.
SELECT * FROM Customers WHERE country = 'USA';

-- 1.08 Select first_name, last_name, and email of customers with first_name starting with 'J'.
SELECT first_name, last_name, email FROM Customers WHERE first_name LIKE 'J%';

-- 1.09 Select product_name, category, and price in the 'Furniture' category.
SELECT product_name, category, price FROM Products WHERE category = 'Furniture';

-- 1.10 Select product_name, category, and price with price > 300 and < 1000.
SELECT product_name, category, price FROM Products WHERE price > 300 AND price < 1000;

-- 1.11 Select order_id, order_date, and total_amount where order_date = '2025-01-10'.
SELECT order_id, order_date, total_amount FROM Orders WHERE order_date = '2025-01-10';

-- 1.12 Select order_id, order_date, and total_amount where total_amount > 500.
SELECT order_id, order_date, total_amount FROM Orders WHERE total_amount > 500;

-- 1.13 Select order_id, total_amount where total_amount BETWEEN 400 and 800.
SELECT order_id, total_amount FROM Orders WHERE total_amount BETWEEN 400 AND 800;

-- 1.14 Select first_name, last_name, and city of customers in 'London' or 'Paris'.
SELECT first_name, last_name, city FROM Customers WHERE city IN ('London', 'Paris');

-- 1.15 Select all products where price IS NOT NULL.
SELECT * FROM Products WHERE price IS NOT NULL;

-- 1.16 Select all order details where quantity > 1.
SELECT * FROM Order_Items WHERE quantity > 1;

-- 1.17 Select order_id and order_date of orders placed in January 2025.
SELECT order_id, order_date FROM Orders WHERE order_date BETWEEN '2025-01-01' AND '2025-01-31';

-- 1.18 Select product_name and price with 'Electronics' in category.
SELECT product_name, price FROM Products WHERE category LIKE '%Electronics%';

-- 1.19 Select all orders with order_date > '2025-01-15'.
SELECT * FROM Orders WHERE order_date > '2025-01-15';


-- 1.20 Select all products priced greater than the average price of all products.
SELECT * FROM Products WHERE price > (SELECT AVG(price) FROM Products);



-- 					2. ORDER BY Clause
-- 2.1 Select all products ordered by price (ascending).
SELECT * FROM Products ORDER BY price ASC;

-- 2.2 Select all products ordered by stock_quantity (descending).
SELECT * FROM Products ORDER BY stock_quantity DESC;

-- 2.3 Select first_name, last_name, email ordered by last_name (descending).
SELECT first_name, last_name, email FROM Customers ORDER BY last_name DESC;

-- 2.4 Select order_id, order_date, total_amount ordered by order_date.
SELECT order_id, order_date, total_amount FROM Orders ORDER BY order_date;

-- 2.5 Select product_name and price ordered by price (descending).
SELECT product_name, price FROM Products ORDER BY price DESC;

-- 2.6 Select all customers ordered by first_name.
SELECT * FROM Customers ORDER BY first_name;

-- 2.7 Select all orders ordered by total_amount (descending).
SELECT * FROM Orders ORDER BY total_amount DESC;

-- 2.8 Select products with price > 300 AND < 1000 ordered by price (ascending).
SELECT * FROM Products WHERE price > 300 AND price < 1000 ORDER BY price ASC;

-- 				3. AGGREGATE FUNCTIONS (COUNT, SUM, AVG, MAX, MIN)

-- 3.1 Number of orders placed by each customer.
SELECT customer_id, COUNT(order_id) AS order_count FROM Orders GROUP BY customer_id;

-- 3.2 Average price of products in each category.
SELECT category, AVG(price) AS avg_price FROM Products GROUP BY category;

-- 3.3 Count of customers from each country.
SELECT country, COUNT(customer_id) AS customer_count FROM Customers GROUP BY country;


-- 3.4 Highest priced product in each category.
SELECT category, MAX(price) AS max_price FROM Products GROUP BY category;

-- 3.5 Average price of products in 'Furniture' category.
SELECT AVG(price) AS avg_furniture_price FROM Products WHERE category = 'Furniture';



-- 3.6 Total sales amount for each year.
SELECT YEAR(order_date) AS year, SUM(total_amount) AS total_sales FROM Orders GROUP BY YEAR(order_date);

-- 3.7 Total stock available in each category.
SELECT category, SUM(stock_quantity) AS total_stock FROM Products GROUP BY category;

-- 3.8 Total quantity of products ordered in each order.
SELECT order_id, SUM(quantity) AS total_quantity FROM Order_Items GROUP BY order_id;

-- 3.9 Average quantity of products ordered in each order.
SELECT order_id, AVG(quantity) AS avg_quantity FROM Order_Items GROUP BY order_id;


-- 3.10 Count of orders placed by each customer.
SELECT customer_id, COUNT(order_id) AS order_count FROM Orders GROUP BY customer_id;

-- 3.11 Order details with total number of items in each order.
SELECT order_id, COUNT(order_item_id) AS total_items FROM Order_Items GROUP BY order_id;



-- 					4. GROUP BY Clause

-- 4.1 Select the number of orders placed by each customer.

SELECT customer_id, COUNT(order_id) AS number_of_orders
FROM Orders
GROUP BY customer_id;
-- 4.2 Select the total sales amount (total_amount) for each year.


SELECT YEAR(order_date) AS year, SUM(total_amount) AS total_sales
FROM Orders
GROUP BY YEAR(order_date);

-- 4.3 Select the product category and the total stock available in each category.

SELECT category, SUM(stock_quantity) AS total_stock
FROM Products
GROUP BY category;
-- 4.4 Select the total quantity of products ordered in each order.

SELECT order_id, SUM(quantity) AS total_quantity
FROM Order_Items
GROUP BY order_id;

-- 4.5 Select the count of customers from each country in the Customers table.

SELECT country, COUNT(customer_id) AS customer_count
FROM Customers
GROUP BY country;

-- 4.6 Select the product_name, category, and the average price of products in each category.

SELECT product_name, category, AVG(price) AS average_price
FROM Products
GROUP BY category;

-- 4.7 Select the total amount spent by each customer.

SELECT customer_id, SUM(total_amount) AS total_spent
FROM Orders
GROUP BY customer_id;


-- 4.8 Select the count of orders placed by each customer from the Orders table.


SELECT customer_id, COUNT(order_id) AS order_count
FROM Orders
GROUP BY customer_id;



-- 					 5. Date and Time
-- 5.1 Retrieve the current date and time using a single SQL function.


SELECT NOW() AS current_datetime;
-- 5.2 Select all orders where the order_date is in the current month.


SELECT * 
FROM Orders
WHERE MONTH(order_date) = MONTH(CURDATE()) AND YEAR(order_date) = YEAR(CURDATE());
-- 5.3 Retrieve the year, month, and day from the order_date column in the Orders table.


SELECT YEAR(order_date) AS year, MONTH(order_date) AS month, DAY(order_date) AS day
FROM Orders;

-- 5.4 Select all orders placed in the last 15 days using a date function.


SELECT *
FROM Orders
WHERE order_date >= CURDATE() - INTERVAL 15 DAY;

-- 5.5 Add 10 days to the order_date for all orders and display the new date.

SELECT order_id, DATE_ADD(order_date, INTERVAL 10 DAY) AS new_order_date
FROM Orders;

-- 5.6 Subtract 2 months from the order_date column and display the result.


SELECT order_id, DATE_SUB(order_date, INTERVAL 2 MONTH) AS updated_order_date
FROM Orders;

