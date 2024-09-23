IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'Sales')
	EXECUTE('CREATE SCHEMA [Sales]');
GO

--$BeginRegion: BaseTable Sales.Customers
IF NOT EXISTS (SELECT * FROM sys.tables WHERE object_id=OBJECT_ID('[Sales].[Customers]'))
BEGIN
	CREATE TABLE Sales.Customers
	(
		CustomerID INT NOT NULL IDENTITY(1,1),
		CustomerName VARCHAR(50) NULL,
		ContactName VARCHAR(50) NULL,
		Address VARCHAR(50) NULL,
		City VARCHAR(50) NULL,
		PostalCode VARCHAR(50) NULL,
		Country VARCHAR(50) NULL
	) ON [PRIMARY];
	--
	EXEC sys.sp_addextendedproperty 'Description', 'The unique identifier for each customer.', 'SCHEMA', 'Sales', 'TABLE', 'Customers', 'COLUMN', 'CustomerID';
	EXEC sys.sp_addextendedproperty 'Description', 'The name of the customer.', 'SCHEMA', 'Sales', 'TABLE', 'Customers', 'COLUMN', 'CustomerName';
	EXEC sys.sp_addextendedproperty 'Description', 'The name of the contact person for the customer.', 'SCHEMA', 'Sales', 'TABLE', 'Customers', 'COLUMN', 'ContactName';
	EXEC sys.sp_addextendedproperty 'Description', 'The address of the customer.', 'SCHEMA', 'Sales', 'TABLE', 'Customers', 'COLUMN', 'Address';
	EXEC sys.sp_addextendedproperty 'Description', 'The city where the customer is located.', 'SCHEMA', 'Sales', 'TABLE', 'Customers', 'COLUMN', 'City';
	EXEC sys.sp_addextendedproperty 'Description', 'The postal code for the customer.', 'SCHEMA', 'Sales', 'TABLE', 'Customers', 'COLUMN', 'PostalCode';
	EXEC sys.sp_addextendedproperty 'Description', 'The country where the customer is located.', 'SCHEMA', 'Sales', 'TABLE', 'Customers', 'COLUMN', 'Country';
END;
--$EndRegion: BaseTable Sales.Customers
GO

--$BeginRegion: BaseTable Sales.Orders
IF NOT EXISTS (SELECT * FROM sys.tables WHERE object_id=OBJECT_ID('[Sales].[Orders]'))
BEGIN
	CREATE TABLE Sales.Orders
	(
		OrderID INT NULL,
		CustomerID INT NULL,
		EmployeeID INT NULL,
		OrderDate DATE NULL,
		ShipperID INT NULL
	) ON SECONDARY;
	--
	EXEC sys.sp_addextendedproperty 'MS_Description', 'The unique identifier for each order.', 'SCHEMA', 'Sales', 'TABLE', 'Orders', 'COLUMN', 'OrderID';
	EXEC sys.sp_addextendedproperty 'MS_Description', 'The unique identifier for the customer associated with the order that references the CustomerID column in the Customers table.', 'SCHEMA', 'Sales', 'TABLE', 'Orders', 'COLUMN', 'CustomerID';
	EXEC sys.sp_addextendedproperty 'MS_Description', 'The unique identifier for the employee associated with the order that references the EmployeeID column in the Employees table.', 'SCHEMA', 'Sales', 'TABLE', 'Orders', 'COLUMN', 'EmployeeID';
	EXEC sys.sp_addextendedproperty 'MS_Description', 'The date when the order was placed.', 'SCHEMA', 'Sales', 'TABLE', 'Orders', 'COLUMN', 'OrderDate';
	EXEC sys.sp_addextendedproperty 'MS_Description', 'The unique identifier for the shipper associated with the order that references the ShipperID column in the Shippers table.', 'SCHEMA', 'Sales', 'TABLE', 'Orders', 'COLUMN', 'ShipperID';
END;
--$EndRegion: BaseTable Sales.Orders
GO

--$BeginRegion: BaseTable Sales.OrderDetails
IF NOT EXISTS (SELECT * FROM sys.tables WHERE object_id=OBJECT_ID('[Sales].[OrderDetails]'))
BEGIN
	CREATE TABLE Sales.OrderDetails
	(
		OrderDetailID INT NULL,
		OrderID INT NULL,
		ProductID INT NULL,
		Quantity INT NULL
	) ON SECONDARY;
	--
	EXEC sys.sp_addextendedproperty 'Description', 'The unique identifier for each order detail record.', 'SCHEMA', 'Sales', 'TABLE', 'OrderDetails', 'COLUMN', 'OrderDetailID';
	EXEC sys.sp_addextendedproperty 'Description', 'The unique identifier for the order that the order detail belongs to and references OrderID in Orders Table.', 'SCHEMA', 'Sales', 'TABLE', 'OrderDetails', 'COLUMN', 'OrderID';
	EXEC sys.sp_addextendedproperty 'Description', 'The unique identifier for the product that the order detail represents and references ProductID in Products Table.', 'SCHEMA', 'Sales', 'TABLE', 'OrderDetails', 'COLUMN', 'ProductID';
	EXEC sys.sp_addextendedproperty 'Description', 'The quantity of the product that is ordered in this order detail.', 'SCHEMA', 'Sales', 'TABLE', 'OrderDetails', 'COLUMN', 'Quantity';
END;
--$EndRegion: BaseTable Sales.OrderDetails
GO