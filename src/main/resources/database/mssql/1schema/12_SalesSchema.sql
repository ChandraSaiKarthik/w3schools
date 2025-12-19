USE [<<Database>>];
GO

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'sales')
	EXECUTE('CREATE SCHEMA [sales]');
GO

--$BeginRegion: BaseTable sales.Customers
IF NOT EXISTS (SELECT * FROM sys.tables WHERE object_id=OBJECT_ID('[sales].[Customers]'))
BEGIN
	CREATE TABLE sales.Customers
	(
		CustomerID INT NOT NULL IDENTITY(1,1),
		CustomerName VARCHAR(50) NULL,
		ContactName VARCHAR(50) NULL,
		Address VARCHAR(50) NULL,
		City VARCHAR(50) NULL,
		PostalCode VARCHAR(50) NULL,
		Country VARCHAR(50) NULL,
		Created_at DATETIME NULL DEFAULT GETDATE(),
		Created_by VARCHAR(50) NULL DEFAULT SUSER_SNAME(),
		Updated_at DATETIME NULL,
		Updated_by VARCHAR(50) NULL
	) ON [PRIMARY];
	--
	EXEC sys.sp_addextendedproperty 'Description', 'The unique identifier for each customer.', 'SCHEMA', 'sales', 'TABLE', 'Customers', 'COLUMN', 'CustomerID';
	EXEC sys.sp_addextendedproperty 'Description', 'The name of the customer.', 'SCHEMA', 'sales', 'TABLE', 'Customers', 'COLUMN', 'CustomerName';
	EXEC sys.sp_addextendedproperty 'Description', 'The name of the contact person for the customer.', 'SCHEMA', 'sales', 'TABLE', 'Customers', 'COLUMN', 'ContactName';
	EXEC sys.sp_addextendedproperty 'Description', 'The address of the customer.', 'SCHEMA', 'sales', 'TABLE', 'Customers', 'COLUMN', 'Address';
	EXEC sys.sp_addextendedproperty 'Description', 'The city where the customer is located.', 'SCHEMA', 'sales', 'TABLE', 'Customers', 'COLUMN', 'City';
	EXEC sys.sp_addextendedproperty 'Description', 'The postal code for the customer.', 'SCHEMA', 'sales', 'TABLE', 'Customers', 'COLUMN', 'PostalCode';
	EXEC sys.sp_addextendedproperty 'Description', 'The country where the customer is located.', 'SCHEMA', 'sales', 'TABLE', 'Customers', 'COLUMN', 'Country';
END;
--$EndRegion: BaseTable sales.Customers
GO

--$BeginRegion: BaseTable sales.Orders
IF NOT EXISTS (SELECT * FROM sys.tables WHERE object_id=OBJECT_ID('[sales].[Orders]'))
BEGIN
	CREATE TABLE sales.Orders
	(
		OrderID INT NULL,
		CustomerID INT NULL,
		EmployeeID INT NULL,
		OrderDate DATE NULL,
		ShipperID INT NULL,
		Created_at DATETIME NULL DEFAULT GETDATE(),
		Created_by VARCHAR(50) NULL DEFAULT SUSER_SNAME(),
		Updated_at DATETIME NULL,
		Updated_by VARCHAR(50) NULL
	) ON [<<SecFileGroup>>];
	--
	EXEC sys.sp_addextendedproperty 'MS_Description', 'The unique identifier for each order.', 'SCHEMA', 'sales', 'TABLE', 'Orders', 'COLUMN', 'OrderID';
	EXEC sys.sp_addextendedproperty 'MS_Description', 'The unique identifier for the customer associated with the order that references the CustomerID column in the Customers table.', 'SCHEMA', 'sales', 'TABLE', 'Orders', 'COLUMN', 'CustomerID';
	EXEC sys.sp_addextendedproperty 'MS_Description', 'The unique identifier for the employee associated with the order that references the EmployeeID column in the Employees table.', 'SCHEMA', 'sales', 'TABLE', 'Orders', 'COLUMN', 'EmployeeID';
	EXEC sys.sp_addextendedproperty 'MS_Description', 'The date when the order was placed.', 'SCHEMA', 'sales', 'TABLE', 'Orders', 'COLUMN', 'OrderDate';
	EXEC sys.sp_addextendedproperty 'MS_Description', 'The unique identifier for the shipper associated with the order that references the ShipperID column in the Shippers table.', 'SCHEMA', 'sales', 'TABLE', 'Orders', 'COLUMN', 'ShipperID';
END;
--$EndRegion: BaseTable sales.Orders
GO

--$BeginRegion: BaseTable sales.OrderDetails
IF NOT EXISTS (SELECT * FROM sys.tables WHERE object_id=OBJECT_ID('[sales].[OrderDetails]'))
BEGIN
	CREATE TABLE sales.OrderDetails
	(
		OrderDetailID INT NULL,
		OrderID INT NULL,
		ProductID INT NULL,
		Quantity INT NULL,
		Created_at DATETIME NULL DEFAULT GETDATE(),
		Created_by VARCHAR(50) NULL DEFAULT SUSER_SNAME(),
		Updated_at DATETIME NULL,
		Updated_by VARCHAR(50) NULL
	) ON [<<SecFileGroup>>];
	--
	EXEC sys.sp_addextendedproperty 'Description', 'The unique identifier for each order detail record.', 'SCHEMA', 'sales', 'TABLE', 'OrderDetails', 'COLUMN', 'OrderDetailID';
	EXEC sys.sp_addextendedproperty 'Description', 'The unique identifier for the order that the order detail belongs to and references OrderID in Orders Table.', 'SCHEMA', 'sales', 'TABLE', 'OrderDetails', 'COLUMN', 'OrderID';
	EXEC sys.sp_addextendedproperty 'Description', 'The unique identifier for the product that the order detail represents and references ProductID in Products Table.', 'SCHEMA', 'sales', 'TABLE', 'OrderDetails', 'COLUMN', 'ProductID';
	EXEC sys.sp_addextendedproperty 'Description', 'The quantity of the product that is ordered in this order detail.', 'SCHEMA', 'sales', 'TABLE', 'OrderDetails', 'COLUMN', 'Quantity';
END;
--$EndRegion: BaseTable sales.OrderDetails
GO