USE [<<Database>>];
GO

IF NOT EXISTS (SELECT * FROM sys.identity_columns WHERE object_id = OBJECT_ID('[dbo].[Categories]'))
BEGIN
	ALTER TABLE dbo.Categories DROP COLUMN CategoryID;
	ALTER TABLE dbo.Categories ADD CategoryID INT NOT NULL IDENTITY(1,1);
END;
GO

IF NOT EXISTS (SELECT * FROM sys.identity_columns WHERE object_id = OBJECT_ID('[dbo].[Customers]'))
BEGIN
	ALTER TABLE dbo.Customers DROP COLUMN CustomerID;
	ALTER TABLE dbo.Customers ADD CustomerID INT NOT NULL IDENTITY(1,1);
END;
GO

IF NOT EXISTS (SELECT * FROM sys.identity_columns WHERE object_id = OBJECT_ID('[dbo].[Employees]'))
BEGIN
	ALTER TABLE dbo.Employees DROP COLUMN EmployeeID;
	ALTER TABLE dbo.Employees ADD EmployeeID INT NOT NULL IDENTITY(1,1);
END;
GO

IF NOT EXISTS (SELECT * FROM sys.identity_columns WHERE object_id = OBJECT_ID('[dbo].[Shippers]'))
BEGIN
	ALTER TABLE dbo.Shippers DROP COLUMN ShipperID;
	ALTER TABLE dbo.Shippers ADD ShipperID INT NOT NULL IDENTITY(1,1);
END;
GO

IF NOT EXISTS (SELECT * FROM sys.identity_columns WHERE object_id = OBJECT_ID('[dbo].[Suppliers]'))
BEGIN
	ALTER TABLE dbo.Suppliers DROP COLUMN SupplierID;
	ALTER TABLE dbo.Suppliers ADD SupplierID INT NOT NULL IDENTITY(1,1);
END;
GO

IF NOT EXISTS (SELECT * FROM sys.identity_columns WHERE object_id = OBJECT_ID('[dbo].[Products]'))
BEGIN
	ALTER TABLE dbo.Products DROP COLUMN ProductID;
	ALTER TABLE dbo.Products ADD ProductID INT NOT NULL IDENTITY(1,1);
END;
GO

IF NOT EXISTS (SELECT * FROM sys.identity_columns WHERE object_id = OBJECT_ID('[dbo].[Orders]'))
BEGIN
	ALTER TABLE dbo.Orders DROP COLUMN OrderID;
	ALTER TABLE dbo.Orders ADD OrderID INT NOT NULL IDENTITY(1,1);
END;
GO

IF NOT EXISTS (SELECT * FROM sys.identity_columns WHERE object_id = OBJECT_ID('[dbo].[OrderDetails]'))
BEGIN
	ALTER TABLE dbo.OrderDetails DROP COLUMN OrderDetailID;
	ALTER TABLE dbo.OrderDetails ADD OrderDetailID INT NOT NULL IDENTITY(1,1);
END;
GO
