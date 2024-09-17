USE [<<Database>>];
GO

IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[dbo].[Categories]', 'U') AND name = N'CategoryName') BEGIN  ALTER TABLE [dbo].[Categories] ADD [CategoryName] varchar(50) NULL; END;
IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[dbo].[Categories]', 'U') AND name = N'Description') BEGIN  ALTER TABLE [dbo].[Categories] ADD [Description] varchar(100) NULL; END;
GO

IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[dbo].[Customers]', 'U') AND name = N'CustomerName') BEGIN  ALTER TABLE [dbo].[Customers] ADD [CustomerName] varchar(50) NULL; END;
IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[dbo].[Customers]', 'U') AND name = N'ContactName') BEGIN  ALTER TABLE [dbo].[Customers] ADD [ContactName] varchar(50) NULL; END;
IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[dbo].[Customers]', 'U') AND name = N'Address') BEGIN  ALTER TABLE [dbo].[Customers] ADD [Address] varchar(50) NULL; END;
IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[dbo].[Customers]', 'U') AND name = N'City') BEGIN  ALTER TABLE [dbo].[Customers] ADD [City] varchar(50) NULL; END;
IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[dbo].[Customers]', 'U') AND name = N'PostalCode') BEGIN  ALTER TABLE [dbo].[Customers] ADD [PostalCode] varchar(50) NULL; END;
IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[dbo].[Customers]', 'U') AND name = N'Country') BEGIN  ALTER TABLE [dbo].[Customers] ADD [Country] varchar(50) NULL; END;
GO

IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[dbo].[Employees]', 'U') AND name = N'LastName') BEGIN  ALTER TABLE [dbo].[Employees] ADD [LastName] varchar(50) NULL; END;
IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[dbo].[Employees]', 'U') AND name = N'FirstName') BEGIN  ALTER TABLE [dbo].[Employees] ADD [FirstName] varchar(50) NULL; END;
IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[dbo].[Employees]', 'U') AND name = N'BirthDate') BEGIN  ALTER TABLE [dbo].[Employees] ADD [BirthDate] date NULL; END;
IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[dbo].[Employees]', 'U') AND name = N'Photo') BEGIN  ALTER TABLE [dbo].[Employees] ADD [Photo] varchar(50) NULL; END;
IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[dbo].[Employees]', 'U') AND name = N'Notes') BEGIN  ALTER TABLE [dbo].[Employees] ADD [Notes] varchar(4000) NULL; END;
GO

IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[dbo].[OrderDetails]', 'U') AND name = N'OrderID') BEGIN  ALTER TABLE [dbo].[OrderDetails] ADD [OrderID] int NULL; END;
IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[dbo].[OrderDetails]', 'U') AND name = N'ProductID') BEGIN  ALTER TABLE [dbo].[OrderDetails] ADD [ProductID] int NULL; END;
IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[dbo].[OrderDetails]', 'U') AND name = N'Quantity') BEGIN  ALTER TABLE [dbo].[OrderDetails] ADD [Quantity] int NULL; END;
GO

IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[dbo].[Orders]', 'U') AND name = N'CustomerID') BEGIN  ALTER TABLE [dbo].[Orders] ADD [CustomerID] int NULL; END;
IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[dbo].[Orders]', 'U') AND name = N'EmployeeID') BEGIN  ALTER TABLE [dbo].[Orders] ADD [EmployeeID] int NULL; END;
IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[dbo].[Orders]', 'U') AND name = N'OrderDate') BEGIN  ALTER TABLE [dbo].[Orders] ADD [OrderDate] date NULL; END;
IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[dbo].[Orders]', 'U') AND name = N'ShipperID') BEGIN  ALTER TABLE [dbo].[Orders] ADD [ShipperID] int NULL; END;
GO

IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[dbo].[Products]', 'U') AND name = N'ProductName') BEGIN  ALTER TABLE [dbo].[Products] ADD [ProductName] varchar(50) NULL; END;
IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[dbo].[Products]', 'U') AND name = N'SupplierID') BEGIN  ALTER TABLE [dbo].[Products] ADD [SupplierID] int NULL; END;
IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[dbo].[Products]', 'U') AND name = N'CategoryID') BEGIN  ALTER TABLE [dbo].[Products] ADD [CategoryID] int NULL; END;
IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[dbo].[Products]', 'U') AND name = N'Unit') BEGIN  ALTER TABLE [dbo].[Products] ADD [Unit] varchar(50) NULL; END;
IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[dbo].[Products]', 'U') AND name = N'Price') BEGIN  ALTER TABLE [dbo].[Products] ADD [Price] decimal(18, 2) NULL; END;
GO

IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[dbo].[Shippers]', 'U') AND name = N'ShipperName') BEGIN  ALTER TABLE [dbo].[Shippers] ADD [ShipperName] varchar(50) NULL; END;
IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[dbo].[Shippers]', 'U') AND name = N'Phone') BEGIN  ALTER TABLE [dbo].[Shippers] ADD [Phone] varchar(15) NULL; END;
GO

IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[dbo].[Suppliers]', 'U') AND name = N'SupplierName') BEGIN  ALTER TABLE [dbo].[Suppliers] ADD [SupplierName] varchar(50) NULL; END;
IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[dbo].[Suppliers]', 'U') AND name = N'ContactName') BEGIN  ALTER TABLE [dbo].[Suppliers] ADD [ContactName] varchar(50) NULL; END;
IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[dbo].[Suppliers]', 'U') AND name = N'Address') BEGIN  ALTER TABLE [dbo].[Suppliers] ADD [Address] varchar(50) NULL; END;
IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[dbo].[Suppliers]', 'U') AND name = N'City') BEGIN  ALTER TABLE [dbo].[Suppliers] ADD [City] varchar(50) NULL; END;
IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[dbo].[Suppliers]', 'U') AND name = N'PostalCode') BEGIN  ALTER TABLE [dbo].[Suppliers] ADD [PostalCode] varchar(50) NULL; END;
IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[dbo].[Suppliers]', 'U') AND name = N'Country') BEGIN  ALTER TABLE [dbo].[Suppliers] ADD [Country] varchar(50) NULL; END;
GO