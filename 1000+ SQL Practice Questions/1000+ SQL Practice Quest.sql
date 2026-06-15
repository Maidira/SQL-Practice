# For this I have used MySQL tool

-- =====================================================
-- Find all employees whose salary is greater than 4000.
-- =====================================================
	
DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
employee_id INT PRIMARY KEY,
name VARCHAR(50),
salary DECIMAL(10, 2)
);
INSERT INTO employees (employee_id, name, salary)
VALUES
(1, 'John Doe', 5000.00),
(2, 'Jane Smith', 3500.00),
(3, 'Emily Davis', 4200.00),
(4, 'Michael Scott', 3800.00),
(5, 'Pam Beesly', 4500.00);

SELECT *
FROM
	employees
WHERE 
	salary > 4000;
    

-- =====================================================
-- List all books published in the year 2023.
-- =====================================================

DROP TABLE IF EXISTS books;

CREATE TABLE books (
book_id INT PRIMARY KEY,
title VARCHAR(100),
author VARCHAR(50),
published_year INT
);

INSERT INTO books (book_id, title, author, published_year)
VALUES
(1, 'SQL for Beginners', 'Author A', 2023),
(2, 'Advanced SQL Techniques', 'Author B', 2022),
(3, 'Database Design', 'Author C', 2023),
(4, 'Learn SQL in 7 Days', 'Author D', 2021),
(5, 'Mastering SQL', 'Author E', 2023);


SELECT *
FROM
	books
WHERE
	published_year = 2023;
    
    
 -- =====================================================   
-- Count the number of products in the products table.
-- =====================================================

DROP TABLE IF EXISTS products;
    
CREATE TABLE products (
product_id INT PRIMARY KEY,
product_name VARCHAR(50),
price DECIMAL(10, 2)
);
INSERT INTO products (product_id, product_name, price)
VALUES
(1, 'Laptop', 1000.00),
(2, 'Smartphone', 700.00),
(3, 'Tablet', 300.00),
(4, 'Headphones', 50.00),
(5, 'Monitor', 200.00);   


SELECT
	COUNT(*) AS total_products
FROM
	products;
    
    
-- =====================================================    
--  Find all orders placed by the customer with customer_id = 1.   
-- =====================================================

DROP TABLE IF EXISTS orders;
    
CREATE TABLE orders (
order_id INT PRIMARY KEY,
customer_id INT,
product_name VARCHAR(50),
order_date DATE
);

INSERT INTO orders (order_id, customer_id, product_name, order_date)
VALUES
(1, 1, 'Laptop', '2024-12-01'),
(2, 2, 'Smartphone', '2024-12-02'),
(3, 1, 'Tablet', '2024-12-03'),
(4, 3, 'Headphones', '2024-12-04'),
(5, 2, 'Monitor', '2024-12-05');    
    
    
SELECT * 
FROM
	orders
WHERE customer_id = 1;
    

-- =====================================================    
-- Retrieve all rows from the cities table.
-- =====================================================

DROP TABLE IF EXISTS cities;
CREATE TABLE cities (
city_id INT PRIMARY KEY,
city_name VARCHAR(50),
country VARCHAR(50)
);

INSERT INTO cities (city_id, city_name, country)
VALUES
(1, 'New York', 'USA'),
(2, 'London', 'UK'),
(3, 'Paris', 'France'),
(4, 'Tokyo', 'Japan'),
(5, 'Sydney', 'Australia');

SELECT * FROM cities;


-- =====================================================
-- Find all customers who are older than 30.
-- =====================================================


DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
customer_id INT PRIMARY KEY,
name VARCHAR(50),
age INT
);
INSERT INTO customers (customer_id, name, age)
VALUES
(1, 'Anna', 28),
(2, 'Brian', 35),
(3, 'Clara', 32),
(4, 'David', 29),
(5, 'Ella', 40);


SELECT
	*
FROM 
	customers
WHERE
	AGE > 30;


-- =====================================================
-- Display all animals whose species is 'Dog'.
-- =====================================================

DROP TABLE IF EXISTS animals;

CREATE TABLE animals (
animal_id INT PRIMARY KEY,
name VARCHAR(50),
species VARCHAR(50),
age INT
);
INSERT INTO animals (animal_id, name, species, age)
VALUES
(1, 'Buddy', 'Dog', 5),
(2, 'Whiskers', 'Cat', 3),
(3, 'Max', 'Dog', 7),
(4, 'Charlie', 'Dog', 2),
(5, 'Luna', 'Cat', 4);


SELECT *
FROM
	animals 
WHERE
	species = 'Dog';

    
-- =====================================================
-- Count the number of movies in the movies table.
-- =====================================================

CREATE TABLE movies (
movie_id INT PRIMARY KEY,
title VARCHAR(100),
genre VARCHAR(50),
release_year INT
);
INSERT INTO movies (movie_id, title, genre, release_year)
VALUES
(1, 'The Shawshank Redemption', 'Drama', 1994),
(2, 'Inception', 'Sci-Fi', 2010),
(3, 'The Godfather', 'Crime', 1972),
(4, 'Frozen', 'Animation', 2013),
(5, 'Avengers: Endgame', 'Action', 2019);


SELECT COUNT(*) FROM movies;


-- =====================================================
-- Find all transactions with an amount greater than 100.
-- =====================================================

DROP TABLE IF EXISTS transactions;

CREATE TABLE transactions (
transaction_id INT PRIMARY KEY,
customer_id INT,
amount DECIMAL(10, 2),
transaction_date DATE
);

INSERT INTO transactions (transaction_id, customer_id, amount, transaction_date)
VALUES
(1, 1, 50.00, '2024-12-01'),
(2, 2, 150.00, '2024-12-02'),
(3, 3, 75.00, '2024-12-03'),
(4, 4, 200.00, '2024-12-04'),
(5, 5, 300.00, '2024-12-05');


SELECT
	*
FROM
	transactions
WHERE
	amount > 100;
    

-- =====================================================
-- List all the employees working at TCS.
-- =====================================================

DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
employee_id INT PRIMARY KEY,
name VARCHAR(50),
company VARCHAR(50),
city VARCHAR(50)
);
INSERT INTO employees (employee_id, name, company, city)
VALUES
(1, 'Amit', 'TCS', 'Mumbai'),
(2, 'Riya', 'Infosys', 'Bangalore'),
(3, 'Karan', 'TCS', 'Chennai'),
(4, 'Sara', 'Wipro', 'Hyderabad'),
(5, 'Neha', 'TCS', 'Pune');


SELECT
	*
FROM
	employees
WHERE 
	company = 'TCS';


-- =====================================================
-- Find all Flipkart products priced above 1000.
-- =====================================================

DROP TABLE IF EXISTS products;

CREATE TABLE products (
product_id INT PRIMARY KEY,
product_name VARCHAR(50),
company VARCHAR(50),
price DECIMAL(10, 2)
);
INSERT INTO products (product_id, product_name, company, price)
VALUES
(1, 'Smartphone', 'Flipkart', 1500.00),
(2, 'Shoes', 'Myntra', 800.00),
(3, 'Laptop', 'Flipkart', 50000.00),
(4, 'T-shirt', 'Ajio', 500.00),
(5, 'Headphones', 'Flipkart', 1200.00);


SELECT
	*
FROM
	products
WHERE
	company = 'Flipkart' AND price > 1000;


-- =====================================================
-- Count the number of Ola rides taken in December 2024.
-- =====================================================

DROP TABLE IF EXISTS rides;

CREATE TABLE rides (
ride_id INT PRIMARY KEY,
customer_name VARCHAR(50),
company VARCHAR(50),
ride_date DATE
);
INSERT INTO rides (ride_id, customer_name, company, ride_date)
VALUES
(1, 'Raj', 'Ola', '2024-12-01'),
(2, 'Simran', 'Uber', '2024-12-03'),
(3, 'Arjun', 'Ola', '2024-12-05'),
(4, 'Deepa', 'Ola', '2024-12-10'),
(5, 'Maya', 'Uber', '2024-12-15');


SELECT
	COUNT(*) AS Ola_rides
FROM
	rides
WHERE 
	company = 'Ola'
    AND
	ride_date BETWEEN '2024-12-01' AND '2024-12-31';


-- =====================================================
-- List all cities where Wipro has offices.
-- =====================================================

DROP TABLE IF EXISTS offices;

CREATE TABLE offices (
office_id INT PRIMARY KEY,
company VARCHAR(50),
city VARCHAR(50)
);
INSERT INTO offices (office_id, company, city)
VALUES
(1, 'TCS', 'Mumbai'),
(2, 'Infosys', 'Bangalore'),
(3, 'Wipro', 'Hyderabad'),
(4, 'Wipro', 'Kolkata'),
(5, 'Infosys', 'Chennai');


SELECT
	DISTINCT city
FROM 
	offices
WHERE
	company = 'Wipro';


-- =====================================================
-- Find the total revenue generated by Zomato orders.
-- =====================================================

DROP TABLE IF EXISTS orders;

CREATE TABLE orders (
order_id INT PRIMARY KEY,
company VARCHAR(50),
amount DECIMAL(10, 2)
);
INSERT INTO orders (order_id, company, amount)
VALUES
(1, 'Zomato', 500.00),
(2, 'Swiggy', 300.00),
(3, 'Zomato', 700.00),
(4, 'Swiggy', 200.00),
(5, 'Zomato', 1000.00);


SELECT
	SUM(amount) AS total_revenue
FROM
	orders
WHERE
	company = 'Zomato';


-- =====================================================
-- Retrieve all customers who have booked flights with Indigo.
-- =====================================================

DROP TABLE IF EXISTS flights;

CREATE TABLE flights (
flight_id INT PRIMARY KEY,
customer_name VARCHAR(50),
airline VARCHAR(50)
);
INSERT INTO flights (flight_id, customer_name, airline)
VALUES
(1, 'Akshay', 'Indigo'),
(2, 'Meera', 'Air India'),
(3, 'Vishal', 'Indigo'),
(4, 'Nidhi', 'Vistara'),
(5, 'Kiran', 'Indigo');


SELECT *
FROM
	flights
WHERE
	airline = 'Indigo';


-- =====================================================
-- Find all ITC products in the products table.
-- =====================================================

DROP TABLE IF EXISTS products;

CREATE TABLE products (
product_id INT PRIMARY KEY,
product_name VARCHAR(50),
company VARCHAR(50),
category VARCHAR(50)
);
INSERT INTO products (product_id, product_name, company, category)
VALUES
(1, 'Bingo', 'ITC', 'Snacks'),
(2, 'Notebook', 'Classmate', 'Stationery'),
(3, 'Sunfeast', 'ITC', 'Biscuits'),
(4, 'Shampoo', 'HUL', 'Personal Care'),
(5, 'Aashirvaad', 'ITC', 'Flour');


SELECT 
	product_name
FROM 
	products
WHERE
	company = 'ITC';
    

-- =====================================================
--  Find all Jio customers who recharged for more than 300.
-- =====================================================

DROP TABLE IF EXISTS recharges;

CREATE TABLE recharges (
recharge_id INT PRIMARY KEY,
customer_name VARCHAR(50),
company VARCHAR(50),
amount DECIMAL(10, 2)
);
INSERT INTO recharges (recharge_id, customer_name, company, amount)
VALUES
(1, 'Ankit', 'Jio', 350.00),
(2, 'Rohit', 'Airtel', 200.00),
(3, 'Priya', 'Jio', 400.00),
(4, 'Sneha', 'Vodafone', 250.00),
(5, 'Vivek', 'Jio', 150.00);


SELECT
	*
FROM 
	recharges
WHERE
	company = 'Jio'
    AND
	amount > 300;
    

-- =====================================================
-- Count the number of Paytm transactions done in November 2024.
-- =====================================================

DROP TABLE IF EXISTS transactions;

CREATE TABLE transactions (
transaction_id INT PRIMARY KEY,
company VARCHAR(50),
amount DECIMAL(10, 2),
transaction_date DATE
);
INSERT INTO transactions (transaction_id, company, amount, transaction_date)
VALUES
(1, 'Paytm', 100.00, '2024-11-01'),
(2, 'Google Pay', 200.00, '2024-11-02'),
(3, 'Paytm', 300.00, '2024-11-03'),
(4, 'PhonePe', 150.00, '2024-11-04'),
(5, 'Paytm', 250.00, '2024-11-05');


SELECT
	COUNT(*) AS Paytm_Transactions
FROM
	transactions
WHERE 
	company = 'Paytm'
    AND
	transaction_date BETWEEN '2024-11-01' AND '2024-11-30';


-- =====================================================
-- List all customers who have accounts in SBI.
-- =====================================================

DROP TABLE IF EXISTS accounts;

CREATE TABLE accounts (
account_id INT PRIMARY KEY,
customer_name VARCHAR(50),
bank_name VARCHAR(50)
);
INSERT INTO accounts (account_id, customer_name, bank_name)
VALUES
(1, 'Ramesh', 'SBI'),
(2, 'Geeta', 'HDFC'),
(3, 'Suresh', 'SBI'),
(4, 'Kavita', 'ICICI'),
(5, 'Anjali', 'SBI');


SELECT
	*
FROM
	accounts
WHERE 
	bank_name = 'SBI';


-- =====================================================
-- Find all suppliers who provide products in the Electronics category.
-- =====================================================

DROP TABLE IF EXISTS suppliers;
DROP TABLE IF EXISTS products;

-- Suppliers Table:
CREATE TABLE suppliers (
supplier_id INT PRIMARY KEY,
supplier_name VARCHAR(100)
);
-- Products Table:
CREATE TABLE products (
product_id INT PRIMARY KEY,
product_name VARCHAR(100),
category VARCHAR(50),
supplier_id INT
);
INSERT INTO suppliers VALUES
(1, 'Supplier A'),
(2, 'Supplier B');
INSERT INTO products VALUES
(1, 'Smartphone', 'Electronics', 1),
(2, 'Washing Machine', 'Appliances', 2);


SELECT
	s.supplier_name
FROM 
	suppliers s
JOIN
	products p
ON s.supplier_id = p.supplier_id
WHERE
	p.category = 'Electronics';


-- =====================================================
-- List all orders along with customer names from the orders and customers tables.
-- =====================================================

DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS orders;

-- Customers Table:
CREATE TABLE customers (
id INT PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50)
);
-- Orders Table:
CREATE TABLE orders (
id INT PRIMARY KEY,
customer_id INT,
order_date DATE
);
INSERT INTO customers VALUES
(1, 'Raj', 'Verma'),
(2, 'Sneha', 'Rao');
INSERT INTO orders VALUES
(1, 1, '2023-05-12'),
(2, 2, '2023-05-14');


SELECT
	c.first_name, c.last_name, o.order_date
FROM
	customers c
JOIN
	orders o
ON c.id = o.customer_id;


-- =====================================================
-- Get the number of unique orders placed in January 2024.
-- =====================================================

DROP TABLE IF EXISTS orders;

CREATE TABLE orders (
order_id INT PRIMARY KEY,
order_date DATE
);
INSERT INTO orders VALUES
(1, '2024-01-05'),
(2, '2024-01-05'),
(3, '2024-01-15'),
(4, '2023-02-10');

SELECT 
	DISTINCT COUNT(order_id) AS order_placed
FROM 
	orders
WHERE
	order_date BETWEEN '2024-01-01' AND '2024-01-31';


-- =====================================================
-- Count the total number of transactions per customer.
-- =====================================================

DROP TABLE IF EXISTS transactions;
CREATE TABLE transactions (
transaction_id INT PRIMARY KEY,
customer_id INT
);

INSERT INTO transactions VALUES
(1, 1),
(2, 2),
(3, 1),
(4, 3);


SELECT
	customer_id, COUNT(transaction_id) AS total_transaction
FROM
	transactions
GROUP BY customer_id;


-- =====================================================
-- Given the employee table with columns EMP_ID and SALARY, write an SQL query to find all salaries greater than the average salary. Return EMP_ID and SALARY.
-- =====================================================

DROP TABLE IF EXISTS employee;

CREATE TABLE employee (
EMP_ID INT PRIMARY KEY,
SALARY DECIMAL(10, 2)
);

INSERT INTO employee (EMP_ID, SALARY) VALUES
(1, 50000),
(2, 60000),
(3, 70000),
(4, 45000),
(5, 80000),
(6, 55000),
(7, 75000),
(8, 62000),
(9, 48000),
(10, 85000);


SELECT *
FROM
	employee
WHERE
	SALARY > 
		(SELECT 
			AVG(SALARY)
            FROM
				employee);

	
-- =====================================================
-- List all courses offered by a training institute.
-- =====================================================

DROP TABLE IF EXISTS courses;

CREATE TABLE courses (
course_id INT,
course_name VARCHAR(100),
duration VARCHAR(20)
);

INSERT INTO courses VALUES
(1, 'Data Science', '6 months'),
(2, 'Web Development', '3 months'),
(3, 'Digital Marketing', '2 months'),
(4, 'AI & ML', '4 months'),
(5, 'Cloud Computing', '5 months');


SELECT
	DISTINCT(course_name) AS courses_names
FROM
	courses;


-- =====================================================
-- Find all public sector banks established before 2000.
-- =====================================================

DROP TABLE IF EXISTS public_sector_banks;

CREATE TABLE public_sector_banks (
bank_id INT PRIMARY KEY,
bank_name VARCHAR(100),
established_year INT
);
INSERT INTO public_sector_banks VALUES
(1, 'State Bank of India', 1955),
(2, 'Bank of Baroda', 1908),
(3, 'Union Bank of India', 2001);

SELECT *
FROM
	public_sector_banks
WHERE
	established_year < 2000;


-- =====================================================
-- Find the total revenue generated from each product.
-- =====================================================

DROP TABLE IF EXISTS sales;
DROP TABLE IF EXISTS products;


-- Sales Table:
CREATE TABLE sales (
sale_id INT PRIMARY KEY,
product_id INT,
revenue DECIMAL(10, 2)
);
INSERT INTO sales VALUES
(1, 1, 50000.00),
(2, 2, 75000.00),
(3, 1, 30000.00);

-- Products Table:
CREATE TABLE products (
product_id INT PRIMARY KEY,
product_name VARCHAR(100)
);
INSERT INTO products VALUES
(1, 'Smartphone'),
(2, 'Laptop'),
(3, 'Washing Machine');


SELECT
	p.product_name,
    SUM(s.revenue) AS total_revenue
FROM
	products p
JOIN	sales s
	ON p.product_id = s.product_id
GROUP BY
	p.product_name;


-- =====================================================
-- List products with stock less than 10.
-- =====================================================

DROP TABLE IF EXISTS products;

CREATE TABLE products (
product_id INT PRIMARY KEY,
product_name VARCHAR(100),
stock INT
);
INSERT INTO products VALUES
(1, 'Smartphone', 5),
(2, 'Laptop', 20),
(3, 'T-shirt', 8);


SELECT 
	product_name, stock
FROM 
	products
WHERE 
	stock < 10;  
  

-- =====================================================
-- Write a SQL query to find the total number of employees in each company.
-- =====================================================

DROP TABLE IF EXISTS companies;
DROP TABLE IF EXISTS employees;
  
-- Companies Table:
CREATE TABLE companies (
company_id INT PRIMARY KEY,
company_name VARCHAR(100)
);

-- Employees Table:
CREATE TABLE employees (
employee_id INT PRIMARY KEY,
employee_name VARCHAR(100),
company_id INT,
salary DECIMAL(10, 2),
FOREIGN KEY (company_id) REFERENCES companies(company_id)
);

INSERT INTO companies (company_id, company_name) VALUES
(1, 'TechCorp'),
(2, 'HealthInc'),
(3, 'FinanceSolutions'),
(4, 'EduGlobal'),
(5, 'RetailWorld');

INSERT INTO employees (employee_id, employee_name, company_id, salary) VALUES
(1, 'Alice', 1, 90000),
(2, 'Bob', 2, 70000),
(3, 'Charlie', 1, 80000),
(4, 'David', 3, 95000),
(5, 'Eva', 4, 65000),
(6, 'Frank', 5, 60000),
(7, 'Grace', 2, 72000);  
  
  
SELECT
	c.company_name,
    COUNT(e.employee_id) AS total_employees
FROM
	companies c
JOIN	employees e
	ON c.company_id = e.company_id
GROUP BY
	e.employee_id;
  

-- =====================================================
-- Retrieve the top 3 highest-paid employees from the employees table.
-- =====================================================

DROP TABLE IF EXISTS employees;  
  
CREATE TABLE employees (
emp_id INT PRIMARY KEY,
name VARCHAR(50),
salary DECIMAL(10,2)
);

INSERT INTO employees VALUES
(1, 'Amit', 90000),
(2, 'Kavya', 75000),
(3, 'Rahul', 60000);  
  

SELECT
	*
FROM
	employees
ORDER BY
	salary DESC
LIMIT 3;


-- =====================================================
-- Retrieve the names of all employees who are also managers.
-- =====================================================

DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
emp_id INT PRIMARY KEY,
employee_name VARCHAR(100),
manager_id INT,
FOREIGN KEY (manager_id) REFERENCES employees(emp_id)
);

INSERT INTO employees (emp_id, employee_name, manager_id)
VALUES
(1, 'John Doe', NULL),
(2, 'Jane Smith', 1),
(3, 'Alice Johnson', 1),
(4, 'Bob Brown', 3),
(5, 'Emily White', NULL),
(6, 'Michael Lee', 3),
(7, 'David Clark', NULL),
(8, 'Sarah Davis', 2),
(9, 'Kevin Wilson', 2),
(10, 'Laura Martinez', 4);

-- Using CTE
WITH CTE AS (
	SELECT DISTINCT manager_id
    FROM
		employees
	WHERE
		manager_id IS NOT NULL
)
SELECT
	employee_name 
FROM
	employees e
JOIN CTE c
WHERE
	e.emp_id = c.manager_id;

-- Using subquery
SELECT
	DISTINCT e.employee_name
FROM 
	employees e
WHERE
	e.emp_id 
    IN
		(
		SELECT DISTINCT manager_id
			FROM
				employees
			WHERE
				manager_id IS NOT NULL);


-- =====================================================
-- Find the missing number
-- =====================================================

DROP TABLE IF EXISTS numbers;
CREATE TABLE numbers (
    num INT
);

INSERT INTO numbers VALUES
(1),(2),(3),(4),(5),(10);

WITH RECURSIVE sequence AS(
	SELECT 
		MIN(num) AS n
	FROM
		numbers
        
	UNION ALL
    
    SELECT
		n+1
	FROM sequence
    WHERE
		n < (SELECT MAX(num) FROM numbers)
)

SELECT
	n AS missing
FROM
	sequence
WHERE
	n NOT IN (
		SELECT
			num
		FROM numbers
    );


-- =====================================================
-- Find the total revenue generated by each product category for Flipkart.
-- =====================================================

DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS orders;

-- Products table
CREATE TABLE products (
product_id INT PRIMARY KEY,
product_name VARCHAR(50),
category VARCHAR(50),
price DECIMAL(10, 2)
);
-- Orders table
CREATE TABLE orders (
order_id INT PRIMARY KEY,
product_id INT,
quantity INT,
FOREIGN KEY (product_id) REFERENCES products(product_id)
);
-- Sample data for products
INSERT INTO products (product_id, product_name, category, price)
VALUES
(1, 'Smartphone', 'Electronics', 15000.00),
(2, 'Shoes', 'Footwear', 2000.00),
(3, 'Laptop', 'Electronics', 50000.00),
(4, 'T-shirt', 'Clothing', 500.00),
(5, 'Headphones', 'Electronics', 1500.00);

-- Sample data for orders
INSERT INTO orders (order_id, product_id, quantity)
VALUES
(1, 1, 3),
(2, 2, 4),
(3, 3, 2),
(4, 4, 10),
(5, 5, 5);


SELECT
	p.category,
    SUM(p.price * o.quantity) AS total_revenue
FROM
	products p
JOIN
	orders o
ON
	p.product_id = o.product_id
GROUP BY
	p.category;
    

-- =====================================================
-- Find the highest-paid employee in each department for Infosys.
-- =====================================================

DROP TABLE IF EXISTS employees;

-- Employees table
CREATE TABLE employees (
employee_id INT PRIMARY KEY,
name VARCHAR(50),
department VARCHAR(50),
salary DECIMAL(10, 2)
);
-- Sample data for employees
INSERT INTO employees (employee_id, name, department, salary)
VALUES
(1, 'Ankit', 'HR', 50000.00),
(2, 'Riya', 'Engineering', 100000.00),
(3, 'Vivek', 'HR', 60000.00),
(4, 'Sara', 'Engineering', 120000.00),
(5, 'Neha', 'Finance', 70000.00);


WITH cte AS (
	SELECT *,
    RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS rnk
    FROM 
		employees
)
SELECT
	*
FROM
	cte
WHERE 
	rnk = 1;


-- =====================================================
-- List all customers who placed orders worth more than the average order value on Swiggy.
-- =====================================================

DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS orders;

-- Customers table
CREATE TABLE customers (
customer_id INT PRIMARY KEY,
name VARCHAR(50)
);
-- Orders table
CREATE TABLE orders (
order_id INT PRIMARY KEY,
customer_id INT,
total_amount DECIMAL(10, 2),
FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
-- Sample data for customers
INSERT INTO customers (customer_id, name)
VALUES
(1, 'Rahul'),
(2, 'Priya'),
(3, 'Arjun'),
(4, 'Meera'),
(5, 'Kiran');
-- Sample data for orders
INSERT INTO orders (order_id, customer_id, total_amount)
VALUES
(1, 1, 500.00),
(2, 2, 800.00),
(3, 3, 600.00),
(4, 4, 700.00),
(5, 5, 300.00);



SELECT 
	c.customer_id, c.name, o.total_amount
FROM
	customers c
JOIN orders o
ON c.customer_id = o.customer_id
WHERE
	total_amount > (
			SELECT
			AVG(total_amount)
			FROM
			orders
    );


-- =====================================================
-- Find all cities where TCS has more than 3 employees.
-- =====================================================

DROP TABLE IF EXISTS employees;

-- Employees table
CREATE TABLE employees (
employee_id INT PRIMARY KEY,
name VARCHAR(50),
company VARCHAR(50),
city VARCHAR(50)
);
-- Sample data for employees
INSERT INTO employees (employee_id, name, company, city)
VALUES
(1, 'Amit', 'TCS', 'Mumbai'),
(2, 'Riya', 'TCS', 'Mumbai'),
(3, 'Karan', 'TCS', 'Pune'),
(4, 'Sara', 'TCS', 'Mumbai'),
(5, 'Neha', 'TCS', 'Pune'),
(6, 'Raj', 'TCS', 'Hyderabad'),
(7, 'Meena', 'TCS', 'Mumbai');


SELECT 
	city
FROM
	employees
GROUP BY company = 'TCS'
HAVING
	SUM(employee_id) > 3;


-- =====================================================
-- List all sellers on Amazon who sold more than 5 different products.
-- =====================================================

DROP TABLE IF EXISTS sellers;
DROP TABLE IF EXISTS products;

-- Sellers table
CREATE TABLE sellers (
seller_id INT PRIMARY KEY,
name VARCHAR(50)
);
-- Products table
CREATE TABLE products (
product_id INT PRIMARY KEY,
seller_id INT,
name VARCHAR(50),
FOREIGN KEY (seller_id) REFERENCES sellers(seller_id)
);
-- Sample data for sellers
INSERT INTO sellers (seller_id, name)
VALUES
(1, 'Seller A'),
(2, 'Seller B'),
(3, 'Seller C');
-- Sample data for products
INSERT INTO products (product_id, seller_id, name)
VALUES
(1, 1, 'Laptop'),
(2, 1, 'Mouse'),
(3, 1, 'Keyboard'),
(4, 1, 'Monitor'),
(5, 1, 'Speaker'),
(6, 1, 'Tablet'),
(7, 2, 'Shoes'),
(8, 2, 'T-shirt'),
(9, 3, 'Headphones');


SELECT
	s.seller_id
FROM
	sellers s
JOIN
	products p
ON s.seller_id = p.seller_id
GROUP BY
	s.seller_id
HAVING
	COUNT(DISTINCT p.name) > 5;


-- =====================================================
-- Find the most ordered product on Zomato.
-- =====================================================

DROP TABLE IF EXISTS orders;

CREATE TABLE orders (
order_id INT PRIMARY KEY,
product_name VARCHAR(50),
quantity INT
);
-- Sample data for orders
INSERT INTO orders (order_id, product_name, quantity)
VALUES
(1, 'Pizza', 5),
(2, 'Burger', 3),
(3, 'Pizza', 7),
(4, 'Pasta', 2),
(5, 'Pizza', 6),
(6, 'Burger', 4);


SELECT
	product_name,
    SUM(quantity) AS total_quantity
FROM
	orders
GROUP BY product_name
ORDER BY
	SUM(quantity) DESC
LIMIT 1;


-- =====================================================
-- Find all customers who have accounts in both SBI and ICICI.
-- =====================================================
DROP TABLE IF EXISTS accounts;

CREATE TABLE accounts (
customer_id INT,
bank_name VARCHAR(50)
);
-- Sample data for accounts
INSERT INTO accounts (customer_id, bank_name)
VALUES
(1, 'SBI'),
(2, 'ICICI'),
(3, 'SBI'),
(1, 'ICICI'),
(4, 'HDFC'),
(3, 'ICICI');


SELECT
	*
FROM 
	accounts
WHERE 
	bank_name IN ('SBI' , 'ICICI')
GROUP BY
	customer_id
HAVING
	COUNT(DISTINCT bank_name) = 2;


-- =====================================================
-- Find the employee(s) with the second-highest salary in Infosys.
-- =====================================================
DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
employee_id INT PRIMARY KEY,
name VARCHAR(50),
salary DECIMAL(10, 2)
);

INSERT INTO employees (employee_id, name, salary)
VALUES
(1, 'Amit', 50000.00),
(2, 'Riya', 60000.00),
(3, 'Vivek', 80000.00),
(4, 'Sara', 70000.00),
(5, 'Neha', 60000.00);


SELECT
    employee_id,
    name,
    salary
FROM employees
WHERE salary =
(
    SELECT MAX(salary)
    FROM employees
    WHERE salary <
    (
        SELECT MAX(salary)
        FROM employees
    )
);


-- =====================================================
-- Find all movies released after 2015 with a rating higher than the average rating of all movies.
-- =====================================================
DROP TABLE IF EXISTS movies;

CREATE TABLE movies (
movie_id INT PRIMARY KEY,
name VARCHAR(50),
release_year INT,
rating DECIMAL(3, 1)
);

INSERT INTO movies (movie_id, name, release_year, rating)
VALUES
(1, 'Movie A', 2014, 8.2),
(2, 'Movie B', 2016, 7.5),
(3, 'Movie C', 2018, 8.8),
(4, 'Movie D', 2020, 7.9),
(5, 'Movie E', 2013, 6.5);


SELECT *
FROM
movies
WHERE
	release_year > 2015
    AND
	rating > (
	SELECT
		AVG(rating)
	FROM
		movies
    );


-- =====================================================
-- Find the total number of transactions done per day by Paytm, sorted in descending order of the number of transactions.
-- =====================================================
DROP TABLE IF EXISTS transactions;

CREATE TABLE transactions (
transaction_id INT PRIMARY KEY,
company VARCHAR(50),
transaction_date DATE
);

INSERT INTO transactions (transaction_id, company, transaction_date)
VALUES
(1, 'Paytm', '2024-12-01'),
(2, 'Paytm', '2024-12-01'),
(3, 'Google Pay', '2024-12-01'),
(4, 'Paytm', '2024-12-02'),
(5, 'Paytm', '2024-12-02'),
(6, 'PhonePe', '2024-12-02');


SELECT 
	transaction_date, COUNT(transaction_id) AS total_transactions
FROM 
	transactions
WHERE 
	company = 'Paytm'
GROUP BY 
	transaction_date
ORDER BY 
	total_transactions DESC;


-- =====================================================
-- Find the top 3 most profitable companies in each industry.
-- =====================================================
DROP TABLE IF EXISTS companies;

CREATE TABLE companies (
company_id INT PRIMARY KEY,
name VARCHAR(50),
industry VARCHAR(50),
revenue DECIMAL(15, 2),
profit DECIMAL(15, 2)
);

INSERT INTO companies (company_id, name, industry, revenue, profit)
VALUES
(1, 'Apple', 'Technology', 365000000000, 94680000000),
(2, 'Microsoft', 'Technology', 198000000000, 72900000000),
(3, 'Amazon', 'E-commerce', 469800000000, 33240000000),
(4, 'Tesla', 'Automotive', 53800000000, 5563000000),
(5, 'Google', 'Technology', 282000000000, 76000000000),
(6, 'Walmart', 'Retail', 572800000000, 15000000000);


WITH cte AS (
	SELECT
		name,
        industry,
        profit,
        DENSE_RANK() OVER(PARTITION BY industry ORDER BY profit DESC) AS rnk
	FROM
		companies
)
SELECT
	*
FROM
	cte
WHERE
	rnk <= 3;


-- =====================================================
-- Calculate the average revenue and profit for each sector and list sectors where the average profit exceeds $10 billion.
-- =====================================================
DROP TABLE IF EXISTS companies;

CREATE TABLE companies (
company_id INT PRIMARY KEY,
name VARCHAR(50),
industry VARCHAR(50),
revenue DECIMAL(15, 2),
profit DECIMAL(15, 2)
);

INSERT INTO companies (company_id, name, industry, revenue, profit)
VALUES
(1, 'Apple', 'Technology', 365000000000, 94680000000),
(2, 'Microsoft', 'Technology', 198000000000, 72900000000),
(3, 'Amazon', 'E-commerce', 469800000000, 33240000000),
(4, 'Tesla', 'Automotive', 53800000000, 5563000000),
(5, 'Google', 'Technology', 282000000000, 76000000000),
(6, 'Walmart', 'Retail', 572800000000, 15000000000);


SELECT
	name,
    industry,
	AVG(revenue) AS avg_revenue,
    AVG(profit) AS avg_profit
FROM
	companies
GROUP BY
	industry
HAVING 
		AVG(profit) > 10000000000;


-- =====================================================
-- Find the company with the second-highest revenue in the Technology sector.
-- =====================================================
DROP TABLE IF EXISTS companies;

CREATE TABLE companies (
company_id INT PRIMARY KEY,
name VARCHAR(50),
industry VARCHAR(50),
revenue DECIMAL(15, 2),
profit DECIMAL(15, 2)
);

INSERT INTO companies (company_id, name, industry, revenue, profit)
VALUES
(1, 'Apple', 'Technology', 365000000000, 94680000000),
(2, 'Microsoft', 'Technology', 198000000000, 72900000000),
(3, 'Amazon', 'E-commerce', 469800000000, 33240000000),
(4, 'Tesla', 'Automotive', 53800000000, 5563000000),
(5, 'Google', 'Technology', 282000000000, 76000000000),
(6, 'Walmart', 'Retail', 572800000000, 15000000000);



SELECT
	name,
    revenue
FROM
	companies
WHERE 
	industry = 'Technology'
	AND
	revenue = (
		SELECT 
			MAX(revenue)
		FROM
			companies
		WHERE
			industry = 'Technology'
			AND
			revenue < (
				SELECT
					MAX(revenue)
				FROM
					companies
				WHERE
					industry = 'Technology'
			)
    );


-- =====================================================
-- List all employees of Google who earn above the average salary of employees in the Technology sector.
-- =====================================================
DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
employee_id INT PRIMARY KEY,
name VARCHAR(50),
company VARCHAR(50),
sector VARCHAR(50),
salary DECIMAL(15, 2)
);

INSERT INTO employees (employee_id, name, company, sector, salary)
VALUES
(1, 'Alice', 'Google', 'Technology', 200000.00),
(2, 'Bob', 'Google', 'Technology', 180000.00),
(3, 'Charlie', 'Microsoft', 'Technology', 150000.00),
(4, 'Dave', 'Amazon', 'E-commerce', 170000.00),
(5, 'Eve', 'Google', 'Technology', 220000.00);




SELECT
	employee_id,
    name,
    salary
FROM
	employees
WHERE
	company = 'Google'
	AND 
	salary > (
		SELECT
			AVG(salary)
		FROM
			employees
		WHERE
			sector = 'Technology'
    );


-- =====================================================
-- Find all companies that generate more than 10% of the total revenue of their respective industry.
-- =====================================================
DROP TABLE IF EXISTS companies;

CREATE TABLE companies (
company_id INT PRIMARY KEY,
name VARCHAR(50),
industry VARCHAR(50),
revenue DECIMAL(15, 2)
);

INSERT INTO companies (company_id, name, industry, revenue)
VALUES
(1, 'Apple', 'Technology', 365000000000),
(2, 'Microsoft', 'Technology', 198000000000),
(3, 'Amazon', 'E-commerce', 469800000000),
(4, 'Tesla', 'Automotive', 53800000000),
(5, 'Google', 'Technology', 282000000000),
(6, 'Walmart', 'Retail', 572800000000);


SELECT 
	name, industry, revenue
FROM 
	companies c
WHERE 
	revenue > 0.1 * (
				SELECT 
					SUM(revenue)
				FROM 
					companies
				WHERE 
					industry = c.industry
				);


-- =====================================================
-- List all products sold by Amazon that generate more than 15% of Amazon's total sales.
-- =====================================================
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS sales;

-- Products table
CREATE TABLE products (
product_id INT PRIMARY KEY,
name VARCHAR(50),
company VARCHAR(50),
price DECIMAL(15, 2)
);
-- Sales table
CREATE TABLE sales (
sale_id INT PRIMARY KEY,
product_id INT,
quantity INT,
FOREIGN KEY (product_id) REFERENCES products(product_id)
);
-- Sample data for products and sales
INSERT INTO products (product_id, name, company, price)
VALUES
(1, 'Laptop', 'Amazon', 1500),
(2, 'Smartphone', 'Amazon', 800),
(3, 'Tablet', 'Amazon', 400),
(4, 'Headphones', 'Amazon', 100);
INSERT INTO sales (sale_id, product_id, quantity)
VALUES
(1, 1, 100), -- Laptop sales
(2, 2, 200), -- Smartphone sales
(3, 3, 150), -- Tablet sales
(4, 4, 50); -- Headphones sales

-- CTE
WITH cte AS
(
    SELECT
        p.product_id,
        p.name,
        SUM(p.price * s.quantity) AS product_sales
    FROM products p
    JOIN sales s
        ON p.product_id = s.product_id
    WHERE p.company = 'Amazon'
    GROUP BY p.product_id, p.name
)

SELECT *
FROM cte
WHERE product_sales >
(
    SELECT 0.15 * SUM(product_sales)
    FROM cte
);


-- Windows function
SELECT *
FROM
(
    SELECT
        p.product_id,
        p.name,
        SUM(p.price * s.quantity) AS product_sales,
        SUM(SUM(p.price * s.quantity)) OVER () AS total_sales
    FROM products p
    JOIN sales s
        ON p.product_id = s.product_id
    WHERE p.company = 'Amazon'
    GROUP BY p.product_id, p.name
) t
WHERE product_sales > 0.15 * total_sales;  


-- =====================================================
-- Find the total number of employees working in each sector and list sectors with more than 1 million employees.
-- =====================================================
DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
employee_id INT PRIMARY KEY,
name VARCHAR(50),
company VARCHAR(50),
sector VARCHAR(50),
salary DECIMAL(15, 2)
);

INSERT INTO employees (employee_id, name, company, sector, salary)
VALUES
(1, 'Alice', 'Google', 'Technology', 200000.00),
(2, 'Bob', 'Google', 'Technology', 180000.00),
(3, 'Charlie', 'Microsoft', 'Technology', 150000.00),
(4, 'Dave', 'Amazon', 'E-commerce', 170000.00),
(5, 'Eve', 'Google', 'Technology', 220000.00);


SELECT
	sector,
    COUNT(employee_id) AS total_emp
FROM
	employees
GROUP BY
	sector
HAVING
	total_emp > 1000000;


-- =====================================================
-- Identify the company that has the highest employee-to-revenue ratio.
-- =====================================================
DROP TABLE IF EXISTS companies;

CREATE TABLE companies (
company_id INT PRIMARY KEY,
name VARCHAR(50),
revenue DECIMAL(15, 2),
employees INT
);

INSERT INTO companies (company_id, name, revenue, employees)
VALUES
(1, 'Apple', 365000000000, 147000),
(2, 'Walmart', 572800000000, 2300000),
(3, 'Amazon', 469800000000, 1600000),
(4, 'Tesla', 53800000000, 110000),
(5, 'Google', 282000000000, 156500);


SELECT
	*,
    (employees / revenue) AS employee_to_rev
FROM
	companies
ORDER BY
	employee_to_rev
LIMIT 1;


-- =====================================================
-- Find the total sales for the top 5 performing products of Apple.
-- =====================================================
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS sales;

-- Products table
CREATE TABLE products (
product_id INT PRIMARY KEY,
name VARCHAR(50),
company VARCHAR(50),
price DECIMAL(15, 2)
);
-- Sales table
CREATE TABLE sales (
sale_id INT PRIMARY KEY,
product_id INT,
quantity INT,
FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO products (product_id, name, company, price)
VALUES
(1, 'iPhone', 'Apple', 1000),
(2, 'MacBook Pro', 'Apple', 2500),
(3, 'iPad', 'Apple', 500),
(4, 'Apple Watch', 'Apple', 400),
(5, 'AirPods', 'Apple', 150),
(6, 'iMac', 'Apple', 1800),
(7, 'iPhone 13', 'Apple', 1200),
(8, 'Apple TV', 'Apple', 200);

INSERT INTO sales (sale_id, product_id, quantity)
VALUES
(1, 1, 5000), 
(2, 2, 3000), 
(3, 3, 7000), 
(4, 4, 10000),
(5, 5, 12000), 
(6, 6, 2000), 
(7, 7, 4000),
(8, 8, 8000);


SELECT
    p.product_id,
    p.name,
    SUM(p.price * s.quantity) AS total_sales
FROM products p
JOIN sales s
ON p.product_id = s.product_id
WHERE p.company = 'Apple'
GROUP BY p.product_id, p.name
ORDER BY total_sales DESC
LIMIT 5;


-- =====================================================
-- List all industries where at least 3 companies have profits above the industry average.
-- =====================================================
DROP TABLE IF EXISTS companies;

CREATE TABLE companies (
company_id INT PRIMARY KEY,
name VARCHAR(50),
industry VARCHAR(50),
revenue DECIMAL(15, 2),
profit DECIMAL(15, 2),
employees INT
);

INSERT INTO companies (company_id, name, industry, revenue, profit, employees)
VALUES
(1, 'Apple', 'Technology', 365000000000, 94680000000, 147000),
(2, 'Microsoft', 'Technology', 198000000000, 72900000000, 150000),
(3, 'Amazon', 'E-commerce', 469800000000, 33240000000, 1600000),
(4, 'Tesla', 'Automotive', 53800000000, 5563000000, 110000),
(5, 'Google', 'Technology', 282000000000, 76000000000, 156500),
(6, 'Walmart', 'Retail', 572800000000, 15000000000, 2300000);


WITH cte AS (
	SELECT
		industry,
        AVG(profit) AS avg_profit
	FROM
		companies
	GROUP BY
		industry
)
SELECT
	c.industry,
    c.profit,
    t.avg_profit
FROM
	companies c
JOIN 
	cte t
ON c.industry = t.industry
GROUP BY 
	c.industry
HAVING
	COUNT(c.company_id) >= 3;


-- =====================================================
-- Find the year with the highest number of new patents filed by Microsoft. 61
-- =====================================================
DROP TABLE IF EXISTS patents;

CREATE TABLE patents (
patent_id INT PRIMARY KEY,
company VARCHAR(50),
filing_year INT
);

INSERT INTO patents (patent_id, company, filing_year)
VALUES
(1, 'Microsoft', 2021),
(2, 'Microsoft', 2020),
(3, 'Microsoft', 2020),
(4, 'Apple', 2021),
(5, 'Microsoft', 2021);


SELECT
	company,
	COUNT(patent_id) AS total_patents,
    filing_year
FROM
	patents
WHERE
	company = 'Microsoft'
GROUP BY
	filing_year
LIMIT 1;


-- =====================================================
-- List all companies whose profit margin (profit/revenue) exceeds the average margin across all companies.
-- =====================================================
DROP TABLE IF EXISTS companies;

CREATE TABLE companies (
company_id INT PRIMARY KEY,
name VARCHAR(50),
revenue DECIMAL(15, 2),
profit DECIMAL(15, 2)
);

INSERT INTO companies (company_id, name, revenue, profit)
VALUES
(1, 'Apple', 365000000000, 94680000000),
(2, 'Microsoft', 198000000000, 72900000000),
(3, 'Amazon', 469800000000, 33240000000),
(4, 'Tesla', 53800000000, 5563000000),
(5, 'Google', 282000000000, 76000000000),
(6, 'Walmart', 572800000000, 15000000000);


WITH cte AS (
	SELECT 
		AVG(profit / revenue) AS avg_margin
	FROM companies
)
SELECT 
	name
FROM 
	companies
WHERE 
	(profit / revenue) > (SELECT avg_margin FROM cte);


-- =====================================================
-- Identify the city where Tesla has the maximum number of sales.
-- =====================================================
DROP TABLE IF EXISTS sales;

CREATE TABLE sales (
sale_id INT PRIMARY KEY,
company VARCHAR(50),
city VARCHAR(50),
units_sold INT
);

INSERT INTO sales (sale_id, company, city, units_sold)
VALUES
(1, 'Tesla', 'Los Angeles', 1000),
(2, 'Tesla', 'New York', 1200),
(3, 'Tesla', 'San Francisco', 1500),
(4, 'Tesla', 'Chicago', 900);


SELECT 
	city
FROM 
	sales
WHERE 
	company = 'Tesla'
GROUP BY 
	city
ORDER BY 
	SUM(units_sold) DESC
LIMIT 1;


-- =====================================================
-- Fill the Null value with last non NULL value
-- =====================================================

DROP TABLE IF EXISTS stock_table;


CREATE TABLE stock_table (
    DateKey DATE,
    StocksName VARCHAR(50),
    Price INT
);


INSERT INTO stock_table (DateKey, StocksName, Price)
VALUES
('2023-01-01', 'Infosys', 1400),
('2023-01-02', 'Infosys', NULL),
('2023-01-03', 'Infosys', 1450),
('2023-01-04', 'Infosys', NULL),
('2023-01-05', 'Infosys', NULL),
('2023-01-01', 'Reliance', 2300),
('2023-01-02', 'Reliance', NULL);

WITH cte AS (
	SELECT
		DateKey,
        StocksName,
        Price,
		COUNT(Price) OVER(PARTITION BY StocksName ORDER BY DateKey) AS cnt
	FROM
		stock_table
)

SELECT
    DateKey,
    StocksName,
    Price,
    MAX(Price) OVER (
        PARTITION BY StocksName, cnt
    ) AS Derived_Price
FROM cte
ORDER BY StocksName, DateKey;


-- =====================================================
-- List all employees who earn above the 90th percentile in their company.
-- =====================================================
DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
employee_id INT PRIMARY KEY,
name VARCHAR(50),
company VARCHAR(50),
salary DECIMAL(15, 2)
);

INSERT INTO employees (employee_id, name, company, salary)
VALUES
(1, 'Alice', 'Apple', 200000.00),
(2, 'Bob', 'Apple', 180000.00),
(3, 'Charlie', 'Apple', 150000.00),
(4, 'Dave', 'Apple', 250000.00),
(5, 'Eve', 'Google', 220000.00),
(6, 'Frank', 'Google', 190000.00),
(7, 'Grace', 'Google', 170000.00),
(8, 'Hank', 'Google', 210000.00);


WITH cte AS (
    SELECT
        name,
        company,
        salary,
        PERCENT_RANK() OVER ( PARTITION BY company ORDER BY salary) AS pct_rank
    FROM employees
)
SELECT *
FROM cte
WHERE pct_rank >= 0.9;


-- =====================================================
-- Rank the top 3 industries by total profit and list the companies contributing to those profits.
-- =====================================================
DROP TABLE IF EXISTS companies;

CREATE TABLE companies (
company_id INT PRIMARY KEY,
name VARCHAR(50),
industry VARCHAR(50),
revenue DECIMAL(15, 2),
profit DECIMAL(15, 2)
);

INSERT INTO companies (company_id, name, industry, revenue, profit)
VALUES
(1, 'Apple', 'Technology', 365000000000, 94680000000),
(2, 'Microsoft', 'Technology', 198000000000, 72900000000),
(3, 'Amazon', 'E-commerce', 469800000000, 33240000000),
(4, 'Tesla', 'Automotive', 53800000000, 5563000000),
(5, 'Google', 'Technology', 282000000000, 76000000000),
(6, 'Walmart', 'Retail', 572800000000, 15000000000);

-- Windows Function
WITH cte AS (
    SELECT
        name,
        industry,
        revenue,
        profit,
        
        SUM(profit) OVER(
            PARTITION BY industry
        ) AS total_profit
    FROM companies
),

ranked AS (
    SELECT *,
           DENSE_RANK() OVER(
               ORDER BY total_profit DESC
           ) AS rnk
    FROM cte
)

SELECT
    name,
    industry,
    revenue,
    profit,
    total_profit
FROM ranked
WHERE rnk <= 3
ORDER BY total_profit DESC, profit DESC;


-- CTE
WITH IndustryProfit AS (
	SELECT industry, 
		SUM(profit) AS total_profit
	FROM 
		companies
	GROUP BY 
		industry
	ORDER BY 
		total_profit DESC
	LIMIT 3
)
SELECT 
	c.industry, 
    c.name, 
    c.profit
FROM 
	companies c
JOIN 
	IndustryProfit ip 
    ON c.industry = ip.industry
ORDER BY 
	ip.total_profit DESC, c.profit DESC;


-- =====================================================
-- Find the company that has the highest revenue per employee in the Retail sector.
-- =====================================================
DROP TABLE IF EXISTS companies;

CREATE TABLE companies (
company_id INT PRIMARY KEY,
name VARCHAR(50),
revenue DECIMAL(15, 2),
employees INT,
sector VARCHAR(50)
);

INSERT INTO companies (company_id, name, revenue, employees, sector)
VALUES
(1, 'Apple', 365000000000, 147000, 'Technology'),
(2, 'Walmart', 572800000000, 2300000, 'Retail'),
(3, 'Amazon', 469800000000, 1600000, 'E-commerce'),
(4, 'Tesla', 53800000000, 110000, 'Automotive'),
(5, 'Google', 282000000000, 156500, 'Technology'),
(6, 'Target', 78000000000, 400000, 'Retail');


SELECT
	name,
    sector,
    (revenue / employees) AS rev_per_emp
FROM
	companies
WHERE
	sector = 'Retail'
ORDER BY
	rev_per_emp DESC
LIMIT 1;


-- =====================================================
-- Identify the quarter in which Apple generated its highest revenue for 2024.
-- =====================================================
DROP TABLE IF EXISTS quarterly_revenue;

CREATE TABLE quarterly_revenue (
id INT PRIMARY KEY,
company VARCHAR(50),
quarter VARCHAR(10),
revenue DECIMAL(15, 2)
);

INSERT INTO quarterly_revenue (id, company, quarter, revenue)
VALUES
(1, 'Apple', 'Q1', 100000000000),
(2, 'Apple', 'Q2', 95000000000),
(3, 'Apple', 'Q3', 110000000000),
(4, 'Apple', 'Q4', 115000000000);


SELECT 
	quarter, 
    revenue
FROM 
	quarterly_revenue
WHERE 
	company = 'Apple'
ORDER BY 
	revenue DESC
LIMIT 1;


-- =====================================================
-- Identify products from Amazon that had declining sales over the last 3 quarters.
-- =====================================================
DROP TABLE IF EXISTS quarterly_revenue;

CREATE TABLE quarterly_revenue (
id INT PRIMARY KEY,
company VARCHAR(50),
product_name VARCHAR(50),
quarter VARCHAR(10),
revenue DECIMAL(15, 2)
);

INSERT INTO quarterly_revenue (id, company, product_name, quarter, revenue
)
VALUES
(1, 'Amazon', 'Laptop', 'Q1', 150000.00),
(2, 'Amazon', 'Laptop', 'Q2', 130000.00),
(3, 'Amazon', 'Laptop', 'Q3', 120000.00),
(4, 'Amazon', 'Smartphone', 'Q1', 250000.00),
(5, 'Amazon', 'Smartphone', 'Q2', 240000.00),
(6, 'Amazon', 'Smartphone', 'Q3', 230000.00),
(7, 'Amazon', 'Headphones', 'Q1', 50000.00),
(8, 'Amazon', 'Headphones', 'Q2', 52000.00),
(9, 'Amazon', 'Headphones', 'Q3', 51000.00);


with cte AS(
	SELECT
		company,
        product_name,
        quarter,
        revenue,
        LAG(revenue, 1) OVER(PARTITION BY company, product_name ORDER BY quarter) AS prev_qua_rev,
        LAG(revenue, 2) OVER(PARTITION BY company, product_name ORDER BY quarter) AS prev_qua2_rev
	FROM 
		quarterly_revenue
	WHERE 
		company = 'Amazon'
)
SELECT
	company,
    product_name
FROM
	cte
WHERE
	revenue < prev_qua_rev 
    AND
    prev_qua_rev < prev_qua2_rev
GROUP BY
	company, product_name;


-- =====================================================
-- Find the total revenue and profit for each company for the last 4 quarters, sorted by profit in descending order.
-- =====================================================
DROP TABLE IF EXISTS quarterly_revenue;


CREATE TABLE quarterly_revenue (
id INT PRIMARY KEY,
company VARCHAR(50),
quarter VARCHAR(10),
revenue DECIMAL(15, 2),
profit DECIMAL(15, 2) -- Assuming 20% of revenue as profit
);
INSERT INTO quarterly_revenue (id, company, quarter, revenue, profit)
VALUES
(1, 'Apple', 'Q1', 100000000000, 20000000000), 
(2, 'Apple', 'Q2', 95000000000, 19000000000),
(3, 'Apple', 'Q3', 110000000000, 22000000000),
(4, 'Apple', 'Q4', 115000000000, 23000000000),
(5, 'Microsoft', 'Q1', 90000000000, 18000000000),
(6, 'Microsoft', 'Q2', 95000000000, 19000000000),
(7, 'Microsoft', 'Q3', 100000000000, 20000000000),
(8, 'Microsoft', 'Q4', 105000000000, 21000000000),
(9, 'Amazon', 'Q1', 80000000000, 16000000000),
(10, 'Amazon', 'Q2', 85000000000, 17000000000),
(11, 'Amazon', 'Q3', 90000000000, 18000000000),
(12, 'Amazon', 'Q4', 95000000000, 19000000000);


SELECT
	company,
    SUM(revenue) AS total_revenue,
    SUM(profit) AS total_profit
FROM
	quarterly_revenue
GROUP BY
	company
ORDER BY
	total_profit DESC;


-- =====================================================
-- Rank all employees at Deloitte based on their monthly performance score.
-- =====================================================
DROP TABLE IF EXISTS performance;

CREATE TABLE performance (
employee_id INT PRIMARY KEY,
employee_name VARCHAR(100),
department VARCHAR(50),
performance_score INT
);

INSERT INTO performance VALUES
(1, 'Alice Smith', 'Finance', 90),
(2, 'John Doe', 'Finance', 85),
(3, 'Emma Wilson', 'IT', 95),
(4, 'Liam Brown', 'IT', 89),
(5, 'Sophia Johnson', 'Finance', 87);


SELECT 
	employee_name,
    department,
    DENSE_RANK() OVER(ORDER BY performance_score DESC) AS rnk
FROM
	performance;


-- =====================================================
-- Write a SQL query to find the customer who made the most recent order.
-- =====================================================
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS orders;

CREATE TABLE customers (
customer_id INT PRIMARY KEY,
customer_name VARCHAR(100)
);
CREATE TABLE orders (
order_id INT PRIMARY KEY,
customer_id INT,
amount DECIMAL(10, 2),
order_date DATE,
FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
-- Sample data insertions
INSERT INTO customers (customer_id, customer_name) VALUES
(1, 'Anjali'),
(2, 'Rohan'),
(3, 'Suresh'),
(4, 'Priya'),
(5, 'Rahul');
INSERT INTO orders (order_id, customer_id, amount, order_date) VALUES
(1, 1, 2500, '2023-01-01'),
(2, 2, 3000, '2023-01-02'),
(3, 1, 1500, '2023-02-03'),
(4, 3, 4000, '2023-02-12'),
(5, 1, 3000, '2023-01-05'),
(6, 2, 4500, '2023-01-06'),
(7, 4, 5000, '2023-01-07'),
(8, 5, 2000, '2023-01-08');


SELECT
	c.customer_id,
    o.order_date
FROM
	customers c
JOIN
	orders o
ON c.customer_id = o.customer_id
ORDER BY
	o.order_date DESC
LIMIT 1;


-- =====================================================
-- Find Companies whose revenue grew more than 10% year-over-year consistently.
-- =====================================================
DROP TABLE IF EXISTS quarterly_revenue;

CREATE TABLE quarterly_revenue (
    company VARCHAR(50),
    quarter DATE,
    revenue INT
);

INSERT INTO quarterly_revenue VALUES
('Amazon','2022-03-31',100),
('Amazon','2022-06-30',120),
('Amazon','2022-09-30',140),
('Amazon','2022-12-31',160),

('Amazon','2023-03-31',120),
('Amazon','2023-06-30',150),
('Amazon','2023-09-30',170),
('Amazon','2023-12-31',200),

('Google','2022-03-31',200),
('Google','2022-06-30',220),
('Google','2022-09-30',240),
('Google','2022-12-31',260),

('Google','2023-03-31',205),
('Google','2023-06-30',225),
('Google','2023-09-30',250),
('Google','2023-12-31',270);


-- Using CTE and Self join
with cte AS(
	SELECT
		a.company,
        a.quarter,
        a.revenue AS current_revenue,
        b.revenue AS prev_yr_revneue,
        ((a.revenue - b.revenue) * 100 / a.revenue) AS growth_rev
	FROM
		quarterly_revenue a
	JOIN
		quarterly_revenue b
	ON
		a.company = b.company
        AND
        EXTRACT(YEAR FROM a.quarter) = EXTRACT(YEAR FROM b.quarter) + 1
        AND
		EXTRACT(QUARTER FROM a.quarter) = EXTRACT(QUARTER FROM b.quarter)
)
SELECT
	company
FROM
	cte
GROUP BY
	company
HAVING
	COUNT(quarter) = 4
    AND
    MIN(growth_rev) > 10;


-- Using windows function
with cte AS(
	SELECT
		company,
        quarter,
        revenue,
        LAG(revenue, 4) OVER(PARTITION BY company ORDER BY quarter) AS prev_year_revenue
	FROM
		quarterly_revenue
)
SELECT
	company
FROM
	cte
WHERE
	prev_year_revenue IS NOT NULL
GROUP BY
	company
HAVING
	MIN(
		((revenue - prev_year_revenue) * 100 / revenue)
    ) > 10;
