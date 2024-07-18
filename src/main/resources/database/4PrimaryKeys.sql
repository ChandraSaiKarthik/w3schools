USE [<<Database>>];
GO

IF NOT EXISTS (SELECT * FROM sys.key_constraints WHERE name = 'PK_CategoryID' AND type = 'PK')
BEGIN
	ALTER TABLE dbo.Categories ALTER COLUMN CategoryID INT NOT NULL;
	EXEC ('ALTER TABLE dbo.Categories ADD CONSTRAINT PK_CategoryID PRIMARY KEY CLUSTERED(CategoryID);');
END;
GO

IF NOT EXISTS (SELECT * FROM sys.key_constraints WHERE name = 'PK_CustomerID' AND type = 'PK')
BEGIN
	ALTER TABLE dbo.Customers ALTER COLUMN CustomerID INT NOT NULL;
	EXEC ('ALTER TABLE dbo.Customers ADD CONSTRAINT PK_CustomerID PRIMARY KEY CLUSTERED(CustomerID);');
END;
GO

IF NOT EXISTS (SELECT * FROM sys.key_constraints WHERE name = 'PK_EmployeeID' AND type = 'PK')
BEGIN
	ALTER TABLE dbo.Employees ALTER COLUMN EmployeeID INT NOT NULL;
	EXEC ('ALTER TABLE dbo.Employees ADD CONSTRAINT PK_EmployeeID PRIMARY KEY CLUSTERED(EmployeeID);');
END;
GO

IF NOT EXISTS (SELECT * FROM sys.key_constraints WHERE name = 'PK_ShipperID' AND type = 'PK')
BEGIN
	ALTER TABLE dbo.Shippers ALTER COLUMN ShipperID INT NOT NULL;
	EXEC ('ALTER TABLE dbo.Shippers	ADD CONSTRAINT PK_ShipperID PRIMARY KEY CLUSTERED(ShipperID);');
END;
GO

IF NOT EXISTS (SELECT * FROM sys.key_constraints WHERE name = 'PK_SupplierID' AND type = 'PK')
BEGIN
	ALTER TABLE dbo.Suppliers ALTER COLUMN SupplierID INT NOT NULL;
	EXEC ('ALTER TABLE dbo.Suppliers ADD CONSTRAINT PK_SupplierID PRIMARY KEY CLUSTERED(SupplierID);');
END;
GO

IF NOT EXISTS (SELECT * FROM sys.key_constraints WHERE name = 'PK_ProductID' AND type = 'PK')
BEGIN
	ALTER TABLE dbo.Products ALTER COLUMN ProductID INT NOT NULL;
	EXEC ('ALTER TABLE dbo.Products ADD CONSTRAINT PK_ProductID PRIMARY KEY CLUSTERED(ProductID);');
END;
GO

IF NOT EXISTS (SELECT * FROM sys.key_constraints WHERE name = 'PK_OrderID' AND type = 'PK')
BEGIN
	ALTER TABLE dbo.Orders ALTER COLUMN OrderID INT NOT NULL;
	EXEC ('ALTER TABLE dbo.Orders ADD CONSTRAINT PK_OrderID PRIMARY KEY CLUSTERED(OrderID);');
END;
GO

IF NOT EXISTS (SELECT * FROM sys.key_constraints WHERE name = 'PK_OrderDetailID' AND type = 'PK')
BEGIN
	ALTER TABLE dbo.OrderDetails ALTER COLUMN OrderDetailID INT NOT NULL;
	EXEC ('ALTER TABLE dbo.OrderDetails ADD CONSTRAINT PK_OrderDetailID PRIMARY KEY CLUSTERED(OrderDetailID);');
END;
GO
