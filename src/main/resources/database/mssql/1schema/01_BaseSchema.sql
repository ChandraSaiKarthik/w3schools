USE [<<Database>>];
GO

IF OBJECT_ID(N'[dbo].[Categories]', 'U') IS NULL
	CREATE TABLE dbo.Categories
	(
		CategoryID INT IDENTITY(1, 1),
		CategoryName VARCHAR(50) NULL,
		Description VARCHAR(100) NULL,
		CONSTRAINT PK_CategoryID PRIMARY KEY CLUSTERED (CategoryID),
		CONSTRAINT UK_CategoryName UNIQUE NONCLUSTERED (CategoryName)
	); /*LVL:0*/

IF OBJECT_ID(N'[dbo].[Customers]', 'U') IS NULL
	CREATE TABLE dbo.Customers
	(
		CustomerID INT IDENTITY(1, 1),
		CustomerName VARCHAR(50) NULL,
		ContactName VARCHAR(50) NULL,
		Address VARCHAR(50) NULL,
		City VARCHAR(50) NULL,
		PostalCode VARCHAR(50) NULL,
		Country VARCHAR(50) NULL,
		CONSTRAINT PK_CustomerID PRIMARY KEY CLUSTERED (CustomerID),
		CONSTRAINT UK_CustomerName UNIQUE NONCLUSTERED (CustomerName)
	); /*LVL:0*/

IF OBJECT_ID(N'[dbo].[Employees]', 'U') IS NULL
	CREATE TABLE dbo.Employees
	(
		EmployeeID INT IDENTITY(1, 1),
		LastName VARCHAR(50) NULL,
		FirstName VARCHAR(50) NULL,
		BirthDate DATE NULL,
		Photo VARCHAR(50) NULL,
		Notes VARCHAR(4000) NULL,
		CONSTRAINT PK_EmployeeID PRIMARY KEY CLUSTERED (EmployeeID),
		CONSTRAINT UK_EmployeeName UNIQUE NONCLUSTERED (FirstName, LastName)
	); /*LVL:0*/

IF OBJECT_ID(N'[dbo].[Shippers]', 'U') IS NULL
	CREATE TABLE dbo.Shippers
	(
		ShipperID INT IDENTITY(1, 1),
		ShipperName VARCHAR(50) NULL,
		Phone VARCHAR(15) NULL,
		CONSTRAINT PK_ShipperID PRIMARY KEY CLUSTERED (ShipperID),
		CONSTRAINT UK_ShipperName UNIQUE NONCLUSTERED (ShipperName)
	); /*LVL:0*/

IF OBJECT_ID(N'[dbo].[Suppliers]', 'U') IS NULL
	CREATE TABLE dbo.Suppliers
	(
		SupplierID INT IDENTITY(1, 1),
		SupplierName VARCHAR(50) NULL,
		ContactName VARCHAR(50) NULL,
		Address VARCHAR(50) NULL,
		City VARCHAR(50) NULL,
		PostalCode VARCHAR(50) NULL,
		Country VARCHAR(50) NULL,
		CONSTRAINT PK_SupplierID PRIMARY KEY CLUSTERED (SupplierID),
		CONSTRAINT UK_SupplierName UNIQUE NONCLUSTERED (SupplierName)
	); /*LVL:0*/

IF OBJECT_ID(N'[dbo].[Orders]', 'U') IS NULL
	CREATE TABLE dbo.Orders
	(
		OrderID INT IDENTITY(1, 1),
		CustomerID INT NULL,
		EmployeeID INT NULL,
		OrderDate DATE NULL,
		ShipperID INT NULL,
		CONSTRAINT PK_OrderID PRIMARY KEY CLUSTERED (OrderID),
		CONSTRAINT [Orders.CustomerID=Customers.CustomerID] FOREIGN KEY (CustomerID) REFERENCES dbo.Customers (CustomerID) ON UPDATE CASCADE ON DELETE CASCADE,
		CONSTRAINT [Orders.EmployeeID=Employees.EmployeeID] FOREIGN KEY (EmployeeID) REFERENCES dbo.Employees (EmployeeID) ON UPDATE CASCADE ON DELETE CASCADE,
		CONSTRAINT [Orders.ShipperID=Shippers.ShipperID] FOREIGN KEY (ShipperID) REFERENCES dbo.Shippers (ShipperID) ON UPDATE CASCADE ON DELETE CASCADE
	); /*LVL:1*/

IF OBJECT_ID(N'[dbo].[Products]', 'U') IS NULL
	CREATE TABLE dbo.Products
	(
		ProductID INT IDENTITY(1, 1),
		ProductName VARCHAR(50) NULL,
		SupplierID INT NULL,
		CategoryID INT NULL,
		Unit VARCHAR(50) NULL,
		Price DECIMAL(18, 2) NULL,
		CONSTRAINT PK_ProductID PRIMARY KEY CLUSTERED (ProductID),
		CONSTRAINT UK_ProductName UNIQUE NONCLUSTERED (ProductName),
		CONSTRAINT [Products.CategoryID=Categories.CategoryID] FOREIGN KEY (CategoryID) REFERENCES dbo.Categories (CategoryID) ON UPDATE CASCADE ON DELETE CASCADE,
		CONSTRAINT [Products.SupplierID=Suppliers.SupplierID] FOREIGN KEY (SupplierID) REFERENCES dbo.Suppliers (SupplierID) ON UPDATE CASCADE ON DELETE CASCADE
	); /*LVL:1*/

IF OBJECT_ID(N'[dbo].[OrderDetails]', 'U') IS NULL
	CREATE TABLE dbo.OrderDetails
	(
		OrderDetailID INT IDENTITY(1, 1),
		OrderID INT NULL,
		ProductID INT NULL,
		Quantity INT NULL,
		CONSTRAINT PK_OrderDetailID PRIMARY KEY CLUSTERED (OrderDetailID),
		CONSTRAINT [OrderDetails.OrderID=Orders.OrderID] FOREIGN KEY (OrderID) REFERENCES dbo.Orders (OrderID) ON UPDATE CASCADE ON DELETE CASCADE,
		CONSTRAINT [OrderDetails.ProductID=Products.ProductID] FOREIGN KEY (ProductID) REFERENCES dbo.Products (ProductID) ON UPDATE CASCADE ON DELETE CASCADE
	); /*LVL:2*/