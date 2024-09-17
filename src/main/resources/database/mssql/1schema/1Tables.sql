USE [<<Database>>];
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE object_id=OBJECT_ID('[dbo].[Categories]'))
BEGIN
	CREATE TABLE dbo.Categories
	(
		CategoryID INT NULL,
		CategoryName VARCHAR(50) NULL,
		Description VARCHAR(100) NULL
	) ON [PRIMARY];
END;
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE object_id=OBJECT_ID('[dbo].[Customers]'))
BEGIN
	CREATE TABLE dbo.Customers
	(
		CustomerID INT NULL,
		CustomerName VARCHAR(50) NULL,
		ContactName VARCHAR(50) NULL,
		Address VARCHAR(50) NULL,
		City VARCHAR(50) NULL,
		PostalCode VARCHAR(50) NULL,
		Country VARCHAR(50) NULL
	) ON [PRIMARY];
END;
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE object_id=OBJECT_ID('[dbo].[Employees]'))
BEGIN
	CREATE TABLE dbo.Employees
	(
		EmployeeID INT NULL,
		LastName VARCHAR(50) NULL,
		FirstName VARCHAR(50) NULL,
		BirthDate DATE NULL,
		Photo VARCHAR(50) NULL,
		Notes VARCHAR(4000) NULL
	) ON [PRIMARY];
END;
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE object_id=OBJECT_ID('[dbo].[Shippers]'))
BEGIN
	CREATE TABLE dbo.Shippers
	(
		ShipperID INT NULL,
		ShipperName VARCHAR(50) NULL,
		Phone VARCHAR(15) NULL
	) ON [PRIMARY];
END;
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE object_id=OBJECT_ID('[dbo].[Suppliers]'))
BEGIN
	CREATE TABLE dbo.Suppliers
	(
		SupplierID INT NULL,
		SupplierName VARCHAR(50) NULL,
		ContactName VARCHAR(50) NULL,
		Address VARCHAR(50) NULL,
		City VARCHAR(50) NULL,
		PostalCode VARCHAR(50) NULL,
		Country VARCHAR(50) NULL
	) ON [PRIMARY];
END;
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE object_id=OBJECT_ID('[dbo].[Products]'))
BEGIN
	CREATE TABLE dbo.Products
	(
		ProductID INT NULL,
		ProductName VARCHAR(50) NULL,
		SupplierID INT NULL,
		CategoryID INT NULL,
		Unit VARCHAR(50) NULL,
		Price DECIMAL(18,2) NULL
	) ON [PRIMARY];
END;
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE object_id=OBJECT_ID('[dbo].[Orders]'))
BEGIN
	CREATE TABLE dbo.Orders
	(
		OrderID INT NULL,
		CustomerID INT NULL,
		EmployeeID INT NULL,
		OrderDate DATE NULL,
		ShipperID INT NULL
	) ON SECONDARY;
END;
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE object_id=OBJECT_ID('[dbo].[OrderDetails]'))
BEGIN
	CREATE TABLE dbo.OrderDetails
	(
		OrderDetailID INT NULL,
		OrderID INT NULL,
		ProductID INT NULL,
		Quantity INT NULL
	) ON SECONDARY;
END;
GO
