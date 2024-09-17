USE [<<Database>>];
GO

IF NOT EXISTS (SELECT * FROM sys.key_constraints WHERE name = 'UK_CategoryName' AND type = 'UQ')
BEGIN
	ALTER TABLE dbo.Categories ADD CONSTRAINT UK_CategoryName UNIQUE (CategoryName);
END;
GO

IF NOT EXISTS (SELECT * FROM sys.key_constraints WHERE name = 'UK_CustomerName' AND type = 'UQ')
BEGIN
	ALTER TABLE dbo.Customers ADD CONSTRAINT UK_CustomerName UNIQUE (CustomerName);
END;
GO

IF NOT EXISTS (SELECT * FROM sys.key_constraints WHERE name = 'UK_EmployeeName' AND type = 'UQ')
BEGIN
	ALTER TABLE dbo.Employees ADD CONSTRAINT UK_EmployeeName UNIQUE (FirstName, LastName);
END;
GO

IF NOT EXISTS (SELECT * FROM sys.key_constraints WHERE name = 'UK_ShipperName' AND type = 'UQ')
BEGIN
	ALTER TABLE dbo.Shippers ADD CONSTRAINT UK_ShipperName UNIQUE (ShipperName);
END;
GO

IF NOT EXISTS (SELECT * FROM sys.key_constraints WHERE name = 'UK_SupplierName' AND type = 'UQ')
BEGIN
	ALTER TABLE dbo.Suppliers ADD CONSTRAINT UK_SupplierName UNIQUE (SupplierName);
END;
GO

IF NOT EXISTS (SELECT * FROM sys.key_constraints WHERE name = 'UK_ProductName' AND type = 'UQ')
BEGIN
	ALTER TABLE dbo.Products ADD CONSTRAINT UK_ProductName UNIQUE (ProductName);
END;
GO
