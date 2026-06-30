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


-- =====================================================
-- List all customers who have made purchases in all product categories and the total amount they spent.
-- =====================================================
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS purchases;

CREATE TABLE customers (
customer_id INT,
customer_name VARCHAR(100)
);
CREATE TABLE products (
product_id INT,
product_name VARCHAR(100),
category_id INT,
price DECIMAL(10, 2)
);
CREATE TABLE purchases (
purchase_id INT,
customer_id INT,
product_id INT
);
-- Sample data insertions
INSERT INTO customers VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie');
INSERT INTO products VALUES
(1, 'Laptop', 1, 800),
(2, 'Smartphone', 1, 600),
(3, 'Book', 2, 20),
(4, 'Headphones', 1, 150);
INSERT INTO purchases VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 2, 2),
(5, 2, 3),
(6, 3, 1),
(7, 3, 2),
(8, 3, 4);


SELECT
	c.customer_id,
    SUM(d.price) AS total_amount
FROM
	customers c
JOIN
	purchases p
    ON c.customer_id = p.customer_id
JOIN
	products d
    ON p.product_id = d.product_id
GROUP BY
	c.customer_id
HAVING
	COUNT(DISTINCT d.category_id) = (
		SELECT
			COUNT(DISTINCT category_id)
		FROM
			products
    );

		
-- =====================================================
-- Identify the top 3 employees with the highest salaries within each department at PwC.
-- =====================================================
DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
employee_id INT PRIMARY KEY,
employee_name VARCHAR(100),
department VARCHAR(50),
salary DECIMAL(10, 2)
);

INSERT INTO employees VALUES
(1, 'Chris Martin', 'Consulting', 85000.00),
(2, 'Jennifer Lewis', 'Finance', 92000.00),
(3, 'Emily Taylor', 'Finance', 88000.00),
(4, 'Michael Scott', 'Consulting', 78000.00),
(5, 'David Lee', 'Finance', 95000.00);


WITH RankedEmployees AS (
    SELECT
        employee_id,
        employee_name,
        department,
        salary,
        DENSE_RANK() OVER(PARTITION BY department ORDER BY salary DESC) AS rnk
    FROM employees
)
SELECT *
FROM RankedEmployees
WHERE rnk <= 3;


-- =====================================================
-- Find the latest order placed by each customer.
-- =====================================================
DROP TABLE IF EXISTS orders;

CREATE TABLE orders (
    customer_id INT,
    order_id INT,
    order_date DATE
);

INSERT INTO orders (customer_id, order_id, order_date)
VALUES
(1, 101, '2024-01-01'),
(1, 102, '2024-02-01'),
(1, 103, '2024-02-01'),
(2, 201, '2024-03-01'),
(2, 202, '2024-01-15'),
(3, 301, '2024-04-10'),
(3, 302, '2024-04-10');


WITH cte AS (
    SELECT
        customer_id,
        order_id,
        order_date,
        ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY order_date DESC, order_id DESC) AS rn
    FROM orders
)
SELECT *
FROM cte
WHERE rn = 1;


-- =====================================================
-- Determine the total number of unique suppliers used by both Barclays and HSBC in the same year.
-- =====================================================
DROP TABLE IF EXISTS suppliers;
DROP TABLE IF EXISTS contracts;

CREATE TABLE suppliers (
supplier_id INT PRIMARY KEY,
supplier_name VARCHAR(100)
);
CREATE TABLE contracts (
contract_id INT PRIMARY KEY,
supplier_id INT,
company VARCHAR(50),
contract_date DATE
);

INSERT INTO suppliers VALUES
(1, 'Tech Supplies Ltd'),
(2, 'Finance Services Ltd');
INSERT INTO contracts VALUES
(1, 1, 'Barclays', '2023-02-10'),
(2, 1, 'HSBC', '2023-02-25');


WITH common_suppliers AS (
    SELECT
        EXTRACT(YEAR FROM contract_date) AS contract_year,
        supplier_id
    FROM 
		contracts
    WHERE 
		company IN ('Barclays', 'HSBC')
    GROUP BY
        EXTRACT(YEAR FROM contract_date),
        supplier_id
    HAVING 
		COUNT(DISTINCT company) = 2
)
SELECT
    contract_year,
    COUNT(DISTINCT supplier_id) AS total_unique_suppliers
FROM 
	common_suppliers
GROUP BY 
	contract_year
ORDER BY 
	contract_year;


-- =====================================================
-- Write a SQL query to find customers who have ordered more than once and their total spending.
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
(2, 1, 3000, '2023-01-02'),
(3, 2, 4500, '2023-01-05'),
(4, 3, 4000, '2023-01-12'),
(5, 1, 1500, '2023-01-15'),
(6, 2, 3500, '2023-01-20');


SELECT
	c.customer_id,
    SUM(o.amount) AS total_spending
FROM
	customers c
JOIN
	orders o
	ON c.customer_id = o.customer_id
GROUP BY
	c.customer_id
HAVING
	COUNT(o.order_id) > 1;


-- =====================================================
-- Find the top 5 products with the highest average rating in each category, including their manufacturer and the number of reviews.
-- =====================================================
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS reviews;

CREATE TABLE products (
product_id INT,
product_name VARCHAR(100),
category_id INT,
manufacturer VARCHAR(100)
);
CREATE TABLE reviews (
review_id INT,
product_id INT,
rating DECIMAL(2, 1)
);
-- Sample data insertions
INSERT INTO products VALUES
(1, 'Laptop', 1, 'BrandA'),
(2, 'Smartphone', 1, 'BrandB'),
(3, 'Tablet', 2, 'BrandC'),
(4, 'Headphones', 2, 'BrandA'),
(5, 'Smartwatch', 3, 'BrandD');
INSERT INTO reviews VALUES
(1, 1, 4.5),
(2, 1, 4.7),
(3, 2, 4.3),
(4, 2, 4.8),
(5, 3, 4.0),
(6, 3, 4.5),
(7, 4, 4.8),
(8, 5, 4.2);


WITH cte AS (
	SELECT
		p.product_id,
        p.product_name,
        p.category_id,
        p.manufacturer,
        AVG(r.rating) AS avg_rating,
        COUNT(r.review_id) AS num_of_review,
        DENSE_RANK() OVER(PARTITION BY p.category_id ORDER BY AVG(r.rating) DESC) AS rnk
	FROM 
		products p
	JOIN 
		reviews r
        ON p.product_id = r.product_id
	GROUP BY
		p.product_id,
        p.category_id,
        p.manufacturer
)
SELECT
	product_id,
	product_name,
	category_id,
	manufacturer,
	avg_rating,
    num_of_review
FROM
	cte
WHERE 
	rnk <= 5
ORDER BY 
	category_id, rnk;


-- =====================================================
-- Find all employees who have not taken any training sessions in the last year and the number of projects they are currently assigned to.
-- =====================================================
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS traning_sessions;
DROP TABLE IF EXISTS projects;

CREATE TABLE employees (
employee_id INT,
employee_name VARCHAR(100)
);
CREATE TABLE training_sessions (
session_id INT,
employee_id INT,
training_date DATE
);
CREATE TABLE projects (
project_id INT,
employee_id INT
);
-- Sample data insertions
INSERT INTO employees VALUES
(1, 'John'),
(2, 'Jane'),
(3, 'Mark'),
(4, 'Lucy');
INSERT INTO training_sessions VALUES
(1, 1, '2022-01-10'),
(2, 1, '2021-06-15'),
(3, 2, '2023-02-20'),
(4, 2, '2021-11-01');
INSERT INTO projects VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 3);


SELECT 
	e.employee_name, 
    COUNT(p.project_id) AS num_projects
FROM 
	employees e
LEFT JOIN 
	training_sessions t 
		ON e.employee_id = t.employee_id
		AND t.training_date >= CURDATE() - INTERVAL 1 YEAR
LEFT JOIN 
	projects p 
    ON e.employee_id = p.employee_id
WHERE 
		t.session_id IS NULL 
GROUP BY 
	e.employee_id, e.employee_name
ORDER BY 
	e.employee_name;


-- =====================================================
-- Write an SQL query to find the name of the product with the highest price in each country.
-- =====================================================
DROP TABLE IF EXISTS suppliers;
DROP TABLE IF EXISTS products;

CREATE TABLE suppliers(
supplier_id INT PRIMARY KEY,
supplier_name VARCHAR(25),
country VARCHAR(25)
);
INSERT INTO suppliers
VALUES
(501, 'alan', 'India'),
(502, 'rex', 'US'),
(503, 'dodo', 'India'),
(504, 'rahul', 'US'),
(505, 'zara', 'Canada'),
(506, 'max', 'Canada');
CREATE TABLE products(
product_id INT PRIMARY KEY,
product_name VARCHAR(25),
supplier_id INT,
price FLOAT,
FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)
);
INSERT INTO products
VALUES
(201, 'iPhone 14', 501, 1299),
(202, 'iPhone 8', 502, 999),
(204, 'iPhone 13', 502, 1199),
(203, 'iPhone 11', 503, 1199),
(205, 'iPhone 12', 502, 1199),
(206, 'iPhone 14', 501, 1399),
(214, 'iPhone 15', 503, 1499),
(207, 'iPhone 15', 505, 1499),
(208, 'iPhone 15', 504, 1499),
(209, 'iPhone 12', 502, 1299),
(210, 'iPhone 13', 502, 1199),
(211, 'iPhone 11', 501, 1099),
(212, 'iPhone 14', 503, 1399),
(213, 'iPhone 8', 502, 1099),
(222, 'Samsung Galaxy S21', 504, 1699),
(223, 'Samsung Galaxy S20', 505, 1899),
(224, 'Google Pixel 6', 501, 899),
(225, 'Google Pixel 5', 502, 799),
(226, 'OnePlus 9 Pro', 503, 1699),
(227, 'OnePlus 9', 502, 1999),
(228, 'Xiaomi Mi 11', 501, 899),
(229, 'Xiaomi Mi 10', 504, 699),
(230, 'Huawei P40 Pro', 505, 1099),
(231, 'Huawei P30', 502, 1299),
(232, 'Sony Xperia 1 III', 503, 1199),
(233, 'Sony Xperia 5 III', 501, 999),
(234, 'LG Velvet', 505, 1899),
(235, 'LG G8 ThinQ', 504, 799),
(236, 'Motorola Edge Plus', 502, 1099),
(237, 'Motorola One 5G', 501, 799),
(238, 'ASUS ROG Phone 5', 503, 1999),
(239, 'ASUS ZenFone 8', 504, 999),
(240, 'Nokia 8.3 5G', 502, 899),
(241, 'Nokia 7.2', 501, 699),
(242, 'BlackBerry Key2', 504, 1899),
(243, 'BlackBerry Motion', 502, 799),
(244, 'HTC U12 Plus', 501, 899),
(245, 'HTC Desire 20 Pro', 505, 699),
(246, 'Lenovo Legion Phone Duel', 503, 1499),
(247, 'Lenovo K12 Note', 504, 1499),
(248, 'ZTE Axon 30 Ultra', 501, 1299),
(249, 'ZTE Blade 20', 502, 1599),
(250, 'Oppo Find X3 Pro', 503, 1999);


WITH RankedProducts AS (
    SELECT
        p.product_name,
        p.price,
        s.country,
        ROW_NUMBER() OVER (
            PARTITION BY s.country
            ORDER BY p.price DESC
        ) AS rnk
    FROM products p
    JOIN suppliers s
        ON p.supplier_id = s.supplier_id
)
SELECT
    product_name,
    price,
    country
FROM RankedProducts
WHERE rnk = 1;


-- =====================================================
-- Number of unique locations visited, location with the maximum signals and Total number of signals for that device.
-- =====================================================
DROP TABLE IF EXISTS device_location;

CREATE TABLE device_location (
    device_id INT,
    locations VARCHAR(50)
);

INSERT INTO device_location (device_id, locations)
VALUES
(12, 'Bangalore'),
(12, 'Bangalore'),
(12, 'Bangalore'),
(12, 'Bangalore'),
(12, 'Hosur'),
(12, 'Hosur'),
(13, 'Hyderabad'),
(13, 'Hyderabad'),
(13, 'Secunderabad'),
(13, 'Secunderabad'),
(13, 'Secunderabad');

WITH location_count AS
(
    SELECT
        device_id,
        locations,
        COUNT(*) AS signal_count
    FROM device_location
    GROUP BY device_id, locations
),
ranked AS
(
    SELECT
        device_id,
        locations,
        signal_count,

        ROW_NUMBER() OVER(
            PARTITION BY device_id
            ORDER BY signal_count DESC
        ) AS rn,

        COUNT(*) OVER(
            PARTITION BY device_id
        ) AS no_of_locations,

        SUM(signal_count) OVER(
            PARTITION BY device_id
        ) AS no_of_signals
    FROM location_count
)

SELECT
    device_id,
    no_of_locations,
    locations AS max_signal_location,
    no_of_signals
FROM ranked
WHERE rn = 1;


-- =====================================================
-- Write an SQL query to calculate the difference between the highest salaries in the marketing and engineering departments. Output the absolute difference in salaries.
-- =====================================================
DROP TABLE IF EXISTS salaries;

CREATE TABLE Salaries (
emp_name VARCHAR(50),
department VARCHAR(50),
salary INT,
PRIMARY KEY (emp_name, department)
);

INSERT INTO Salaries (emp_name, department, salary) VALUES
('Kathy', 'Engineering', 50000),
('Roy', 'Marketing', 30000),
('Charles', 'Engineering', 45000),
('Jack', 'Engineering', 85000),
('Benjamin', 'Marketing', 34000),
('Anthony', 'Marketing', 42000),
('Edward', 'Engineering', 102000),
('Terry', 'Engineering', 44000),
('Evelyn', 'Marketing', 53000),
('Arthur', 'Engineering', 32000);

-- Using CTE and Cross join
with mark_sal AS(
	SELECT
		MAX(salary) AS mark_max
	FROM
		Salaries
	WHERE
		department = 'Marketing'
),
eng_sal AS(
	SELECT
		MAX(salary) AS eng_max
	FROM
		Salaries
	WHERE
		department = 'Engineering'
)
SELECT
	ABS(mark_max - eng_max) AS sal_diff
FROM
	mark_sal
CROSS JOIN eng_sal;

-- Using subquery
SELECT
    ABS(
        MAX(CASE WHEN department = 'Marketing' THEN salary END)
        -
        MAX(CASE WHEN department = 'Engineering' THEN salary END)
    ) AS salary_difference
FROM Salaries;


-- =====================================================
-- Write an SQL query to find the average order amount for male and female customers separately. Return the results with 2 decimal points.
-- =====================================================
DROP TABLE IF EXISTS customers; 
DROP TABLE IF EXISTS orders; 

CREATE TABLE customers (
customer_id INT PRIMARY KEY,
customer_name VARCHAR(255),
age INT,
gender VARCHAR(10)
);

CREATE TABLE orders (
order_id INT PRIMARY KEY,
customer_id INT,
order_date DATE,
total_amount DECIMAL(10, 2),
FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO customers (customer_id, customer_name, age, gender)
VALUES
(1, 'John Doe', 30, 'Male'),
(2, 'Jane Smith', 25, 'Female'),
(3, 'Alice Johnson', 35, 'Female'),
(4, 'Bob Brown', 40, 'Male');

INSERT INTO orders (order_id, customer_id, order_date, total_amount)
VALUES
(101, 1, '2023-01-15', 150.50),
(102, 2, '2022-02-20', 200.25),
(103, 3, '2023-03-10', 180.75),
(104, 4, '2023-04-05', 300.00),
(105, 1, '2022-05-12', 175.80),
(106, 2, '2021-06-18', 220.40),
(107, 3, '2023-07-22', 190.30),
(108, 4, '2023-08-30', 250.60),
(109, 4, '2021-08-30', 250.60),
(110, 4, '2024-01-30', 250.60),
(111, 4, '2023-08-30', 250.60);


SELECT
	c.gender,
    ROUND(AVG(o.total_amount) , 2) AS avg_order_amount
FROM
	customers c
JOIN
	orders o
	ON c.customer_id = o.customer_id
GROUP BY
	c.gender;


-- =====================================================
-- Write an SQL query to obtain the third transaction of every user. Output the user id, spend, and transaction date.
-- =====================================================
DROP TABLE IF EXISTS transactions;

CREATE TABLE transactions (
user_id INTEGER,
spend DECIMAL(10, 2),
transaction_date TIMESTAMP
);

INSERT INTO transactions (user_id, spend, transaction_date) VALUES
(111, 100.50, '2022-01-08 12:00:00'),
(111, 55.00, '2022-01-10 12:00:00'),
(121, 36.00, '2022-01-18 12:00:00'),
(145, 24.99, '2022-01-26 12:00:00'),
(111, 89.60, '2022-02-05 12:00:00');


with cte AS(
	SELECT
		user_id,
        spend,
        transaction_date,
		ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY transaction_date) AS tran_num
	FROM
		transactions
)
SELECT
	user_id,
	spend,
	transaction_date,
	tran_num
FROM
	cte
WHERE
	tran_num = 3;


-- =====================================================
-- Find the top 5 products whose revenue has decreased in comparison to the previous year (both 2022 and 2023). Return the product name, revenue for the previous year, revenue for the current year, revenue decreased, and the decreased ratio (percentage).
-- =====================================================
DROP TABLE IF EXISTS product_revenue;

CREATE TABLE product_revenue (
product_name VARCHAR(255),
year INTEGER,
revenue DECIMAL(10, 2)
);
INSERT INTO product_revenue (product_name, year, revenue) VALUES
('Product A', 2022, 10000.00),
('Product A', 2023, 9500.00),
('Product B', 2022, 15000.00),
('Product B', 2023, 14500.00),
('Product C', 2022, 8000.00),
('Product C', 2023, 8500.00),
('Product D', 2022, 12000.00),
('Product D', 2023, 12500.00),
('Product E', 2022, 20000.00),
('Product E', 2023, 19000.00),
('Product F', 2022, 7000.00),
('Product F', 2023, 7200.00),
('Product G', 2022, 18000.00),
('Product G', 2023, 17000.00),
('Product H', 2022, 3000.00),
('Product H', 2023, 3200.00),
('Product I', 2022, 9000.00),
('Product I', 2023, 9200.00),
('Product J', 2022, 6000.00),
('Product J', 2023, 5900.00);

-- Using self join
SELECT
	pr_2023.product_name,
	pr_2022.revenue AS revenue_2022,
	pr_2023.revenue AS revenue_2023,
	(pr_2022.revenue - pr_2023.revenue) AS revenue_decreased,
	ROUND((pr_2022.revenue - pr_2023.revenue) / pr_2022.revenue * 100, 2) AS decreased_ratio
FROM
	product_revenue pr_2022
JOIN
	product_revenue pr_2023
	ON
	pr_2022.product_name = pr_2023.product_name
AND 
	pr_2022.year = 2022
AND 
	pr_2023.year = 2023
WHERE
	pr_2023.revenue < pr_2022.revenue
ORDER BY
	revenue_decreased DESC
LIMIT 5;

-- Using conditional aggregation
WITH revenue_cte AS (
    SELECT
        product_name,
        MAX(CASE WHEN year = 2022 THEN revenue END) AS revenue_2022,
        MAX(CASE WHEN year = 2023 THEN revenue END) AS revenue_2023
    FROM product_revenue
    GROUP BY product_name
)
SELECT
    product_name,
    revenue_2022,
    revenue_2023,
    revenue_2022 - revenue_2023 AS revenue_decreased,
    ROUND(
        (revenue_2022 - revenue_2023) * 100.0 / revenue_2022,
        2
    ) AS decreased_ratio
FROM revenue_cte
WHERE revenue_2023 < revenue_2022
ORDER BY revenue_decreased DESC
LIMIT 5;

-- Using windows function
WITH revenue_cte AS
(
    SELECT
        product_name,
        year,
        revenue,

        LAG(revenue) OVER(
            PARTITION BY product_name
            ORDER BY year
        ) AS previous_year_revenue

    FROM product_revenue
)

SELECT
    product_name,
    previous_year_revenue AS revenue_2022,
    revenue AS revenue_2023,

    previous_year_revenue - revenue AS revenue_decreased,

    ROUND(
        (previous_year_revenue - revenue)
        *100.0/previous_year_revenue,
        2
    ) AS decreased_ratio

FROM revenue_cte
WHERE
    year = 2023
    AND revenue < previous_year_revenue
ORDER BY revenue_decreased DESC
LIMIT 5;


-- =====================================================
-- Write a query that calculates the total viewership for laptops and mobile devices, where mobile is defined as the sum of tablet and phone viewership. Output the total viewership for laptops as laptop_views and the total viewership for mobile devices as mobile_views.
-- =====================================================
DROP TABLE IF EXISTS viewership;

CREATE TABLE viewership (
device_type VARCHAR(255),
viewership_count INTEGER
);

INSERT INTO viewership (device_type, viewership_count) VALUES
('laptop', 5000),
('tablet', 3000),
('phone', 7000),
('laptop', 6000),
('tablet', 4000),
('phone', 8000),
('laptop', 5500),
('tablet', 3500),
('phone', 7500);


SELECT
	SUM(CASE WHEN device_type = 'laptop' THEN viewership_count ELSE 0 END) AS laptop_views,
	SUM(CASE WHEN device_type IN ('tablet', 'phone') THEN viewership_count ELSE 0 END) AS mobile_views
FROM
	viewership;


-- =====================================================
--  Find Duplicate Customers but Keep the Latest Active.
-- =====================================================
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(20),
    city VARCHAR(30),
    status VARCHAR(20),
    updated_at DATETIME
);
INSERT INTO customers VALUES
(101,'John','john@gmail.com','9876543210','Delhi','Active','2024-01-10 10:15:00'),
(102,'John','john@gmail.com','9876543210','Delhi','Inactive','2024-03-18 11:20:00'),
(103,'John','john@gmail.com','9876543210','Mumbai','Active','2024-05-25 09:00:00'),
(104,'Mary','mary@gmail.com','9999999991','Pune','Active','2024-02-14 14:00:00'),
(105,'Mary','mary@gmail.com','9999999991','Pune','Active','2024-06-12 08:45:00'),
(106,'David','david@gmail.com','9999999992','Bangalore','Inactive','2024-01-01 09:00:00'),
(107,'David','david@gmail.com','9999999992','Bangalore','Active','2024-02-11 10:30:00'),
(108,'Sarah','sarah@gmail.com','9999999993','Chennai','Active','2024-04-21 12:00:00'),
(109,'Mike','mike@gmail.com','9999999994','Hyderabad','Active','2024-05-10 11:15:00'),
(110,'Mike','mike@gmail.com','9999999994','Hyderabad','Active','2024-07-01 16:20:00'),
(111,'Emma','emma@gmail.com','9999999995','Delhi','Inactive','2024-06-08 10:00:00'),
(112,'Emma','emma@gmail.com','9999999995','Delhi','Inactive','2024-07-09 10:30:00');


with cte AS(
	SELECT 
		customer_id,
        customer_name,
        email,
        city,
        status,
        updated_at,
        DENSE_RANK() OVER(PARTITION BY email ORDER BY updated_at DESC) AS rnk
	FROM
		customers
)
SELECT
	customer_id,
        customer_name,
        email,
        city,
        status,
        updated_at
FROM
	cte
WHERE
	rnk = 1;


-- =====================================================
--  Top 3 Salaries Per Department (Including Ties).
-- =====================================================
DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    department VARCHAR(30),
    salary INT
);
INSERT INTO employees VALUES
(101,'John','IT',120000),
(102,'David','IT',115000),
(103,'Alex','IT',115000),
(104,'Chris','IT',100000),
(105,'Mary','HR',90000),
(106,'Emma','HR',85000),
(107,'Sophia','HR',85000),
(108,'James','HR',75000),
(109,'Robert','Finance',150000),
(110,'Linda','Finance',140000),
(111,'Kevin','Finance',130000),
(112,'Lisa','Finance',130000),
(113,'Michael','Finance',110000);


with cte AS(
	SELECT
		employee_id,
        employee_name,
        department,
        salary,
        DENSE_RANK() OVER(PARTITION BY department ORDER BY salary DESC) as rnk
	FROM
		employees
)
SELECT
	*
FROM
	cte
WHERE
	rnk <=3;
        

-- =====================================================
--  Find Customers Who Logged In for 7 Consecutive Days.
-- =====================================================
DROP TABLE IF EXISTS user_logins;

CREATE TABLE user_logins (
    login_id INT PRIMARY KEY,
    user_id INT,
    login_date DATE
);
INSERT INTO user_logins VALUES
(1,101,'2024-06-01'),
(2,101,'2024-06-02'),
(3,101,'2024-06-03'),
(4,101,'2024-06-04'),
(5,101,'2024-06-05'),
(6,101,'2024-06-06'),
(7,101,'2024-06-07'),
(8,102,'2024-06-01'),
(9,102,'2024-06-02'),
(10,102,'2024-06-04'),
(11,102,'2024-06-05'),
(12,102,'2024-06-06'),
(13,103,'2024-06-10'),
(14,103,'2024-06-11'),
(15,103,'2024-06-12'),
(16,103,'2024-06-13'),
(17,103,'2024-06-14'),
(18,103,'2024-06-15'),
(19,103,'2024-06-16'),
(20,104,'2024-06-01'),
(21,104,'2024-06-03'),
(22,104,'2024-06-04'),
(23,104,'2024-06-07');

-- First appraoch
with cte AS(
	SELECT
		login_id,
        user_id,
        login_date,
        DATE_SUB(
			login_date,
            INTERVAL ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY login_date) DAY
        ) AS grp
	FROM
		user_logins
)
SELECT
    user_id
FROM cte
GROUP BY
    user_id,
    grp
HAVING COUNT(*)>=7;


-- Second appraoch
WITH cte AS
(
    SELECT
        user_id,
        login_date,
        ROW_NUMBER() OVER(
            PARTITION BY user_id
            ORDER BY login_date
        ) AS rn
    FROM user_logins
),
login_groups AS
(
    SELECT
        user_id,
        login_date,
        DATE_SUB(login_date, INTERVAL rn DAY) AS grp
    FROM cte
)
SELECT
    user_id
FROM login_groups
GROUP BY
    user_id,
    grp
HAVING COUNT(*) >= 7;
	

-- Third appraoch
WITH cte1 AS
(
SELECT
    user_id,
    login_date,
    CASE
        WHEN DATEDIFF(
            login_date,
            LAG(login_date) OVER(
                PARTITION BY user_id
                ORDER BY login_date
            )
        ) = 1
        THEN 0
        ELSE 1
    END AS new_grp
FROM user_logins
),
cte2 AS
(
SELECT
    *,
    SUM(new_grp) OVER(
        PARTITION BY user_id
        ORDER BY login_date
    ) AS grp
FROM cte1
)

SELECT
    user_id
FROM cte2
GROUP BY
    user_id,
    grp
HAVING COUNT(*) >= 7;


-- =====================================================
--  Find Missing Dates.
-- =====================================================
DROP TABLE IF EXISTS sales;

CREATE TABLE sales
(
    sale_id INT PRIMARY KEY,
    sale_date DATE,
    amount DECIMAL(10,2)
);
INSERT INTO sales VALUES
(1,'2024-06-01',1500),
(2,'2024-06-02',2100),
(3,'2024-06-04',1800),
(4,'2024-06-06',2500),
(5,'2024-06-07',2200),
(6,'2024-06-10',1700);


WITH RECURSIVE calendar AS(
	SELECT 
		MIN(sale_date) dt
	FROM 
		sales
	UNION ALL
	SELECT 
		DATE_ADD(dt,INTERVAL 1 DAY)
	FROM 
		calendar
	WHERE dt<
		(
		SELECT MAX(sale_date)
		FROM sales
		)
)
SELECT
	dt AS missing_date
FROM 
	calendar c
LEFT JOIN 
	sales s
ON 
	c.dt=s.sale_date
WHERE 
	s.sale_date IS NULL;


-- =====================================================
--  Running Total (Cumulative Sum).
-- =====================================================
DROP TABLE IF EXISTS daily_sales;

CREATE TABLE daily_sales
(
    sale_id INT PRIMARY KEY,
    sale_date DATE,
    amount INT
);
INSERT INTO daily_sales VALUES
(1,'2024-06-01',1000),
(2,'2024-06-02',1500),
(3,'2024-06-03',800),
(4,'2024-06-04',2200),
(5,'2024-06-05',1200),
(6,'2024-06-06',1800),
(7,'2024-06-07',900);

-- Using Windows function
SELECT
	sale_date,
    amount,
    SUM(amount) OVER(ORDER BY sale_date) AS running_total
FROM
	daily_sales;

-- Using Self join
SELECT
    d1.sale_date,
    d1.amount,
    SUM(d2.amount) AS running_total
FROM daily_sales d1
JOIN daily_sales d2
ON d2.sale_date<=d1.sale_date
GROUP BY
d1.sale_date,
d1.amount
ORDER BY d1.sale_date;


-- =====================================================
--  Running Total (Cumulative Sum).
-- =====================================================
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS orders;

CREATE TABLE customers
(
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(30)
);
CREATE TABLE orders
(
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    amount DECIMAL(10,2)
);
INSERT INTO customers VALUES
(101,'John','Delhi'),
(102,'Mary','Mumbai'),
(103,'David','Pune'),
(104,'Emma','Hyderabad'),
(105,'Chris','Chennai'),
(106,'Sophia','Delhi'),
(107,'Robert','Pune'),
(108,'Lisa','Bangalore');
INSERT INTO orders VALUES
(1001,101,'2024-06-01',1200),
(1002,101,'2024-06-05',800),
(1003,102,'2024-06-03',2500),
(1004,104,'2024-06-10',1500),
(1005,106,'2024-06-08',2000);

-- Using Join
SELECT
    c.customer_id,
    c.customer_name
FROM 
	customers c
LEFT JOIN 
	orders o
ON 
	c.customer_id = o.customer_id
WHERE 
	o.order_id IS NULL;

-- Using NOT EXISTS
SELECT
    customer_id,
    customer_name
FROM customers c
WHERE NOT EXISTS
(
    SELECT 1
    FROM orders o
    WHERE o.customer_id = c.customer_id
);


-- =====================================================
--  Find Products Whose Sales Are Above Their Category Average.
-- =====================================================
DROP TABLE IF EXISTS product_sales;

CREATE TABLE product_sales
(
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(30),
    sales INT
);
INSERT INTO product_sales VALUES
(101,'Laptop','Electronics',1200),
(102,'Mouse','Electronics',400),
(103,'Keyboard','Electronics',500),
(104,'Phone','Electronics',900),
(105,'Chair','Furniture',700),
(106,'Table','Furniture',1000),
(107,'Sofa','Furniture',1500),
(108,'Cupboard','Furniture',800),
(109,'Shampoo','Grocery',200),
(110,'Soap','Grocery',150),
(111,'Oil','Grocery',300),
(112,'Rice','Grocery',600);


WITH CTE as(
	SELECT
        category,
        sales,
        AVG(sales) OVER(PARTITION BY category) AS avg_sales
	FROM
		product_sales
)
SELECT
	*
FROM
	cte
WHERE
	sales > avg_sales;


-- =====================================================
--  Monthly Revenue Running Total.
-- =====================================================
DROP TABLE IF EXISTS monthly_sales;

CREATE TABLE monthly_sales
(
    sale_id INT PRIMARY KEY,
    sale_date DATE,
    revenue INT
);
INSERT INTO monthly_sales VALUES
(1,'2024-01-05',5000),
(2,'2024-01-20',4000),
(3,'2024-02-10',6000),
(4,'2024-02-22',3000),
(5,'2024-03-08',7000),
(6,'2024-03-28',2000),
(7,'2024-04-12',4500),
(8,'2024-04-25',5500),
(9,'2024-05-10',6500),
(10,'2024-05-30',3500);


WITH monthly_revenue AS
(
SELECT
    YEAR(sale_date) AS yr,
    MONTH(sale_date) AS mon,
    SUM(revenue) AS monthly_revenue
FROM 
	monthly_sales
GROUP BY
	YEAR(sale_date),
	MONTH(sale_date)
)
SELECT
	*,
	SUM(monthly_revenue)
	OVER(ORDER BY yr,mon) AS running_revenue
FROM monthly_revenue;


-- =====================================================
--  Top 3 Customers by Total Spending in Each City.
-- =====================================================
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS orders;

CREATE TABLE customers
(
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(30)
);

CREATE TABLE orders
(
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    amount DECIMAL(10,2)
);

INSERT INTO customers VALUES
(101,'John','Delhi'),
(102,'Mary','Delhi'),
(103,'David','Delhi'),
(104,'Emma','Delhi'),
(105,'Chris','Mumbai'),
(106,'Sophia','Mumbai'),
(107,'Robert','Mumbai'),
(108,'Lisa','Mumbai');

INSERT INTO orders VALUES
(1,101,'2024-01-01',500),
(2,101,'2024-01-05',800),
(3,102,'2024-01-03',1200),
(4,103,'2024-01-04',300),
(5,103,'2024-01-10',700),
(6,104,'2024-01-07',600),
(7,105,'2024-01-01',900),
(8,105,'2024-01-08',600),
(9,106,'2024-01-04',700),
(10,107,'2024-01-05',1200),
(11,108,'2024-01-06',400),
(12,108,'2024-01-12',300);


WITH customer_sales AS (
	SELECT
		c.customer_id,
        c.customer_name,
        c.city,
        SUM(o.amount) AS total_amount
	FROM
		customers c
	JOIN
		orders o
		ON c.customer_id = o.customer_id
	GROUP BY
		c.customer_id,
        c.customer_name,
        c.city
),
sales_rank AS (
	SELECT
		*,
        DENSE_RANK() OVER(PARTITION BY city ORDER BY total_amount DESC) AS rnk
	FROM
		customer_sales
)
SELECT
	*
FROM
	sales_rank
WHERE
	rnk <= 3;


-- =====================================================
--  Compare Current Row with Previous Row.
-- =====================================================
DROP TABLE IF EXISTS daily_sales;

CREATE TABLE daily_sales
(
    sale_date DATE,
    sales INT
);

INSERT INTO daily_sales VALUES
('2024-06-01',1000),
('2024-06-02',1200),
('2024-06-03',900),
('2024-06-04',1500),
('2024-06-05',1700),
('2024-06-06',1600),
('2024-06-07',2000);

-- Show today's sales and yesterday's sales.
SELECT
	sale_date,
    sales,
    LAG(sales) OVER(ORDER BY sale_date DESC) AS prev_sales
FROM
	daily_sales;

-- Find daily increase.
SELECT
    sale_date,
    sales,
    LAG(sales)
    OVER(
        ORDER BY sale_date
    ) previous_sales,
    sales -
    LAG(sales)
    OVER(
        ORDER BY sale_date
    ) increase
FROM daily_sales;

-- Show Increase / Decrease
SELECT
    sale_date,
    sales,
    CASE
        WHEN sales >
             LAG(sales)
             OVER(
                ORDER BY sale_date
             ) THEN 'Increase'
        WHEN sales <
             LAG(sales)
             OVER(
                ORDER BY sale_date
             ) THEN 'Decrease'
        ELSE 'Same'
    END trend
FROM daily_sales;

-- Percentage Growth
SELECT
    sale_date,
    sales,
    LAG(sales) OVER( ORDER BY sale_date) AS previous_sales,
    ROUND(
        (sales -
        LAG(sales) OVER(ORDER BY sale_date))
        *100
        /
        LAG(sales) OVER(ORDER BY sale_date)
    ,2)
    growth_percentage
FROM daily_sales;

-- Compare with 2 Days Ago
SELECT
    sale_date,
    sales,
    LAG(sales,2) OVER(ORDER BY sale_date ) AS previous_2_day
FROM daily_sales;
