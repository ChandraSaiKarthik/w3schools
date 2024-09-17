-- psql
-- \c <<Database>>;

CREATE TABLE IF NOT EXISTS Categories
(
	CategoryID SERIAL PRIMARY KEY,
	CategoryName VARCHAR(50),
	Description VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS Customers
(
	CustomerID SERIAL PRIMARY KEY,
	CustomerName VARCHAR(50),
	ContactName VARCHAR(50),
	Address VARCHAR(50),
	City VARCHAR(50),
	PostalCode VARCHAR(50),
	Country VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS Employees
(
	EmployeeID SERIAL PRIMARY KEY,
	LastName VARCHAR(50),
	FirstName VARCHAR(50),
	BirthDate DATE,
	Photo VARCHAR(50),
	Notes VARCHAR(4000)
);

CREATE TABLE IF NOT EXISTS Shippers
(
	ShipperID SERIAL PRIMARY KEY,
	ShipperName VARCHAR(50),
	Phone VARCHAR(15)
);

CREATE TABLE IF NOT EXISTS Suppliers
(
	SupplierID SERIAL PRIMARY KEY,
	SupplierName VARCHAR(50),
	ContactName VARCHAR(50),
	Address VARCHAR(50),
	City VARCHAR(50),
	PostalCode VARCHAR(50),
	Country VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS Products
(
	ProductID SERIAL PRIMARY KEY,
	ProductName VARCHAR(50),
	SupplierID INTEGER,
	CategoryID INTEGER,
	Unit VARCHAR(50),
	Price DECIMAL(18,2)
);

CREATE TABLE IF NOT EXISTS Orders
(
	OrderID SERIAL PRIMARY KEY,
	CustomerID INTEGER,
	EmployeeID INTEGER,
	OrderDate DATE,
	ShipperID INTEGER
);

CREATE TABLE IF NOT EXISTS OrderDetails
(
	OrderDetailID SERIAL PRIMARY KEY,
	OrderID INTEGER,
	ProductID INTEGER,
	Quantity INTEGER
);


