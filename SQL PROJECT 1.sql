create database Customers_Orders_Products 
use Customers_Orders_Products 
CREATE TABLE Customers (
  CustomerID INT PRIMARY KEY,
  Name VARCHAR(50),
  Email VARCHAR(100)
);

INSERT INTO Customers (CustomerID, Name, Email)
VALUES
  (1, 'John Doe', 'johndoe@example.com'),
  (2, 'Jane Smith', 'janesmith@example.com'),
  (3, 'Robert Johnson', 'robertjohnson@example.com'),
  (4, 'Emily Brown', 'emilybrown@example.com'),
  (5, 'Michael Davis', 'michaeldavis@example.com'),
  (6, 'Sarah Wilson', 'sarahwilson@example.com'),
  (7, 'David Thompson', 'davidthompson@example.com'),
  (8, 'Jessica Lee', 'jessicalee@example.com'),
  (9, 'William Turner', 'williamturner@example.com'),
  (10, 'Olivia Martinez', 'oliviamartinez@example.com');
CREATE TABLE Orders (
  OrderID INT PRIMARY KEY,
  CustomerID INT,
  ProductName VARCHAR(50),
  OrderDate DATE,
  Quantity INT
);

INSERT INTO Orders (OrderID, CustomerID, ProductName, OrderDate, Quantity)
VALUES
  (1, 1, 'Product A', '2023-07-01', 5),
  (2, 2, 'Product B', '2023-07-02', 3),
  (3, 3, 'Product C', '2023-07-03', 2),
  (4, 4, 'Product A', '2023-07-04', 1),
  (5, 5, 'Product B', '2023-07-05', 4),
  (6, 6, 'Product C', '2023-07-06', 2),
  (7, 7, 'Product A', '2023-07-07', 3),
  (8, 8, 'Product B', '2023-07-08', 2),
  (9, 9, 'Product C', '2023-07-09', 5),
  (10, 10, 'Product A', '2023-07-10', 1);





CREATE TABLE Products (
  ProductID INT PRIMARY KEY,
  ProductName VARCHAR(50),
  Price DECIMAL(10, 2)
);

INSERT INTO Products (ProductID, ProductName, Price)
VALUES
  (1, 'Product A', 10.99),
  (2, 'Product B', 8.99),
  (3, 'Product C', 5.99),
  (4, 'Product D', 12.99),
  (5, 'Product E', 7.99),
  (6, 'Product F', 6.99),
  (7, 'Product G', 9.99),
  (8, 'Product H', 11.99),
  (9, 'Product I', 14.99),
  (10, 'Product J', 4.99);

--Task 1 :-
  --1.Write a query to retrieve all records from the Customers table..
  SELECT * FROM Customers 

  --2.Write a query to retrieve the names and email addresses of customers whose names start with 'J'
  SELECT Name,Email
  FROM Customers 
  WHERE NAME LIKE 'J%';

 -- 3.Write a query to retrieve the order details (OrderID, ProductName, Quantity) for all orders
SELECT OrderID, ProductName, Quantity
FROM ORDERS;

--4.Write a query to calculate the total quantity of products ordered
SELECT SUM(QUANTITY)
FROM ORDERS

--5.Write a query to retrieve the names of customers who have placed an order
SELECT DISTINCT C.NAME
FROM CUSTOMERS C
JOIN ORDERS O ON C.CUSTOMERID=O.CUSTOMERID;

--6.Write a query to retrieve the products with a price greater than $10.00.
SELECT * FROM PRODUCTS
WHERE PRICE>$10.00;

--7.Write a query to retrieve the customer name and order date for all orders placed on or after '2023-07-05'
SELECT C.NAME,O.ORDERDATE
FROM CUSTOMERS C
JOIN ORDERS O ON C.CUSTOMERID=O.CustomerID
WHERE O.ORDERDATE >='2023-07-05';

--8.Write a query to calculate the average price of all products
SELECT AVG(PRICE) AS AVERAGE_PRICE
FROM PRODUCTS;

--9.Write a query to retrieve the customer names along with the total quantity of products they have ordered
SELECT C.NAME,SUM(O.QUANTITY)AS TOTALQUANTITY
FROM CUSTOMERS C
JOIN ORDERS O ON C.CUSTOMERID=O.CUSTOMERID
GROUP BY C.NAME;

--10.Write a query to retrieve the products that have not been ordered
SELECT P.PRODUCTNAME
FROM PRODUCTS P
LEFT JOIN ORDERS O ON P.PRODUCTNAME=O.PRODUCTNAME
WHERE O.PRODUCTNAME IS NULL;


--Task 2 :-
--1.Write a query to retrieve the top 5 customers who have placed the highest total quantity of orders
SELECT C.NAME,SUM(O.QUANTITY) AS TOTAL_QUANTITY
FROM CUSTOMERS C
JOIN ORDERS O ON C.CUSTOMERID=O.CUSTOMERID
GROUP BY C.NAME
ORDER BY TOTAL_QUANTITY  DESC
SELECT TOP 5  * FROM ORDERS;

--2.Write a query to calculate the average price of products for each product category
SELECT P.PRODUCTNAME, AVG(P.PRICE)
AS AVG_PRICE
FROM PRODUCTS P
GROUP BY P.PRODUCTNAME;

--3.Write a query to retrieve the customers who have not placed any orders
SELECT C.NAME
FROM CUSTOMERS C
LEFT JOIN ORDERS O ON C.CUSTOMERID=O.CUSTOMERID
WHERE O.CUSTOMERID IS NULL;

--4.Write a query to retrieve the order details (OrderID, ProductName, Quantity) for orders placed by customers whose names start with 'M'
SELECT O.ORDERID,O.PRODUCTNAME,O.QUANTITY
FROM ORDERS O
JOIN CUSTOMERS C ON O.CUSTOMERID=C.CUSTOMERID
WHERE C.NAME LIKE 'M%';

--5.Write a query to calculate the total revenue generated from all orders
SELECT SUM(P.PRICE*O.QUANTITY) AS TOTALREVENUE
FROM ORDERS O
JOIN PRODUCTS P ON O.PRODUCTNAME=P.PRODUCTNAME;

--6.Write a query to retrieve the customer names along with the total revenue generated from their orders
SELECT C.NAME, SUM(P.PRICE*O.QUANTITY) AS TOTAL_REVENUE
FROM CUSTOMERS C
JOIN ORDERS O ON C.CUSTOMERID=O.CUSTOMERID
JOIN PRODUCTS P ON O.PRODUCTNAME=P.PRODUCTNAME
GROUP BY C.NAME;

--7.Write a query to retrieve the customers who have placed at least one order for each product category
SELECT C.NAME
FROM CUSTOMERS C
WHERE NOT EXISTS(
SELECT P.PRODUCTNAME
FROM PRODUCTS P
WHERE NOT EXISTS(
SELECT O.ORDERID
FROM ORDERS O
WHERE O.CUSTOMERID=C.CUSTOMERID AND 
O.PRODUCTNAME=P.PRODUCTNAME
));


--8.Write a query to retrieve the customers who have placed orders on consecutive days
SELECT C.NAME
FROM CUSTOMERS C
JOIN ORDERS 01 ON C.CUSTOMERID=01.CUSTOMERID
JOIN ORDERS 02 ON C.CUSTOMERID=02.CUSTOMERID
WHERE 01.ORDERDATE=DATE-ADD(02.ORDERDATE,INTERVAL 1 DAY);

--9.Write a query to retrieve the top 3 products with the highest average quantity ordered
SELECT O.PRODUCTNAME, AVG(O.QUANTITY) AS AVGQUANTITY
FROM ORDERS O
GROUP BY O.PRODUCTNAME
ORDER BY AVGQUANTITY DESC
SELECT TOP 3* FROM ORDERS;

--10.Write a query to calculate the percentage of orders that have a quantity greater than the average quantity
SELECT COUNT (*)*100/(SELECT COUNT(*)FROM ORDERS)AS PERCENTAGE
FROM ORDERS
WHERE QUANTITY>(SELECT AVG(QUANTITY)FROM ORDERS);



--Task 3:-

--1.Write a query to retrieve the customers who have placed orders for all products.
SELECT C.NAME
FROM CUSTOMERS C
WHERE NOT EXISTS(
SELECT P.PRODUCTNAME
FROM PRODUCTS P
WHERE NOT EXISTS(
SELECT O.ORDERID
FROM ORDERS O
WHERE O.CUSTOMERID=C.CUSTOMERID AND
O.PRODUCTNAME=P.PRODUCTNAME
));

--2.Write a query to retrieve the products that have been ordered by all customers.
SELECT P.PRODUCTNAME
FROM PRODUCTS P
WHERE NOT EXISTS(
SELECT C.CUSTOMERID
FROM CUSTOMERS C
WHERE NOT EXISTS(
SELECT O.ORDERID
FROM ORDERS O
WHERE O.CUSTOMERID=C.CUSTOMERID AND 
O.PRODUCTNAME=P.PRODUCTNAME
));

--3.Write a query to calculate the total revenue generated from orders placed in each month.
SELECT DATE-FORMAT(ORDERDATE,'%Y-%M')AS MONTH,
SUM(PRICE*QUANTITY)AS REVENUE
FROM ORDERS 
JOIN PRODUCTS ON ORDERS.PRODUCTNAME=PRODUCTS.PRODUCTNAME
GROUP BY MONTH;

--4.Write a query to retrieve the products that have been ordered by more than 50% of the customers.
SELECT O.PRODUCTNAME
FROM ORDERS O
GROUP BY O.PRODUCTNAME
HAVING COUNT (DISTINCT O.CUSTOMERID)>(SELECT COUNT(*) FROM CUSTOMERS)*0.5;

--5.Write a query to retrieve the customers who have placed orders for all products in a specific category.
SELECT C.NAME
FROM CUSTOMERS C
WHERE NOT EXISTS(
SELECT P.PRODUCTNAME
FROM PRODUCTS P
WHERE P.CATEGORY='SPECIFIC_CATEGORY'
AND NOT EXISTS (
SELECT O.ORDERID
FROM ORDERS O
WHERE O.CUSTOMERID=C.CUSTOMERID AND
O.PRODUCTNAME=P.PRODUCTNAME
));

--6.Write a query to retrieve the top 5 customers who have spent the highest amount of money on orders.
SELECT C.NAME,SUM(P.PRICE*O.QUANTITY) AS TOTAL_SPENT
FROM CUSTOMERS C
JOIN ORDERS O ON C.CUSTOMERID=O.CUSTOMERID
JOIN PRODUCTS P ON O.PRODUCTNAME=P.PRODUCTNAME
GROUP BY C.NAME
ORDER BY TOTAL_SPENT DESC
SELECT TOP 5  *  FROM ORDERS;

--7.Write a query to calculate the running total of order quantities for each customer.
SELECT C.NAME,O.ORDERID,O.QUANTITY,SUM(O.QUANTITY)OVER
PARTITION BY O.CUSTOMERID ORDER BY O.ORDERID AS 
RUNNING_TOTAL
FROM CUSTOMER C
JOIN ORDERS O ON C.CUSTOMERID=O.CUSTOMERID
ORDER BY C.NAME,O.ORDERID;

--8.Write a query to retrieve the top 3 most recent orders for each customer.
SELECT C.NAME,O.ORDERID,O.ORDERDATE
FROM CUSTOMERS C
JOIN ORDERS O ON C.CUSTOMERID=O.CUSTOMERID
WHERE ( SELECT COUNT(*)FROM ORDERS WHERE CUSTOMERID=C.CUSTOMERID AND
ORDERDATE >=O.ORDERDATE)<=3
ORDER BY C.NAME,O.ORDERDATE DESC;

--9.Write a query to calculate the total revenue generated by each customer in the last 30 days.
SELECT C.NAME,SUM(P.PRICE*O.QUANTITY) AS TOTALREVENUE
FROM CUSTOMERS C
JOIN ORDERS O ON C.CUSTOMERID=O.CUSTOMERID JOIN PRODUCTS P ON O.PRODUCTNAME=P.PRODUCTNAME
WHERE O.ORDERDATE >= DATE-SUB(CURDATE(),INTERVAL 30 DAY)
GROUP BY C.NAME;

--10.Write a query to retrieve the customers who have placed orders for at least two different product categories.
SELECT C.NAME
FROM CUSTOMERS C
JOIN ORDERS O ON C.CUSTOMERID=O.CUSTOMERID
JOIN PRODUCTS P ON O.PRODUCTNAME=P.PRODUCTNAME
GROUP BY C.NAME
HAVING COUNT (DISTINCT P.CATEGORY)>=2;


--11.Write a query to calculate the average revenue per order for each customer.
SELECT C.NAME,AVG(P.PRICE*O.QUANTITY) AS AVGREVENUE PER ORDER
FROM CUSTOMERS C
JOIN ORDERS O ON C.CUSTOMERID=O.CUSTOMERID
JOIN PRODUCTS P ON O.PRODUCTNAME=P.PRODUCTNAME
GROUP BY C.NAME;


--12.Write a query to retrieve the products that have been ordered by customers from a specific country.
SELECT DISTINCT P.PRODUCTNAME
FROM PRODUCTS P
JOIN ORDERS O ON P.PRODUCTNAME=O.PRODUCTNAME
JOIN CUSTOMERS C ON O.CUSTOMERID=O.CUSTOMERID
WHERE C.COUNTRY='SPECIFIC_COUNTRY';


--13.Write a query to retrieve the customers who have placed orders for every month of a specific year.
SELECT C.NAME
FROM CUSTOMERS C
WHERE NOT EXISTS(
SELECT DISTINCT DATE-FORMAT(ORDERDATE,'%Y-%M')
FROM ORDERS
WHERE CUSTOMERID=C.CUSTOMERID
AND YEAR(ORDERDATE)=SPECIFIC_YEAR
HAVING COUNT (DISTINCT DATE-FORMAT(ORDERDATE,'%Y-%M'))<12


--14.Write a query to retrieve the customers who have placed orders for a specific product in consecutive months.
SELECT DISTINCT C.NAME
FROM CUSTOMERS C
JOIN ORDERS 01 ON C.CUSTOMERID=01.CUSTOMERID
JOIN ORDERS 02 ON C.CUSTOMERID=02.CUSTOMERID
WHERE 01.PRODUCTNAME='SPECIFIC_PRODUCT'
AND 02.PRODUCTNAME='SPECIFIC_PRODUCT'
AND DATEDIFF(02.ORDERDATE,01.ORDERDATE)=30;

--15.Write a query to retrieve the products that have been ordered by a specific customer at least twice.
SELECT DISTINCT P.PRODUCTNAME
FROM PRODUCTS P
JOIN ORDERS O ON P.PRODUCTNAME=O.PRODUCTNAME
WHERE O.CUSTOMERID=SPECIFIC_CUSTOMER_ID
GROUP BY P.PRODUCTNAME
HAVING COUNT (*)>=2;