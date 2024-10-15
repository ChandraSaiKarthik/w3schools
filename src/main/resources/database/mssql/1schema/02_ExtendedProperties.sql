USE [<<Database>>];
GO

IF NOT EXISTS (SELECT 1 FROM sys.fn_listextendedproperty('Description', 'SCHEMA', 'dbo', 'TABLE', 'Categories', 'COLUMN', 'CategoryName') )
	EXEC sys.sp_addextendedproperty 'Description', 'The name of the category.', 'SCHEMA', 'dbo', 'TABLE', 'Categories', 'COLUMN', 'CategoryName';
IF NOT EXISTS (SELECT 1 FROM sys.fn_listextendedproperty('Description', 'SCHEMA', 'dbo', 'TABLE', 'Categories', 'COLUMN', 'Description') )
	EXEC sys.sp_addextendedproperty 'Description', 'A brief description of the category.', 'SCHEMA', 'dbo', 'TABLE', 'Categories', 'COLUMN', 'Description';
GO

IF NOT EXISTS (SELECT 1 FROM sys.fn_listextendedproperty('Description', 'SCHEMA', 'dbo', 'TABLE', 'Customers', 'COLUMN', 'CustomerName') )
	EXEC sys.sp_addextendedproperty 'Description', 'The name of the customer.', 'SCHEMA', 'dbo', 'TABLE', 'Customers', 'COLUMN', 'CustomerName';
IF NOT EXISTS (SELECT 1 FROM sys.fn_listextendedproperty('Description', 'SCHEMA', 'dbo', 'TABLE', 'Customers', 'COLUMN', 'ContactName') )
	EXEC sys.sp_addextendedproperty 'Description', 'The name of the contact person for the customer.', 'SCHEMA', 'dbo', 'TABLE', 'Customers', 'COLUMN', 'ContactName';
IF NOT EXISTS (SELECT 1 FROM sys.fn_listextendedproperty('Description', 'SCHEMA', 'dbo', 'TABLE', 'Customers', 'COLUMN', 'Address') )
	EXEC sys.sp_addextendedproperty 'Description', 'The address of the customer.', 'SCHEMA', 'dbo', 'TABLE', 'Customers', 'COLUMN', 'Address';
IF NOT EXISTS (SELECT 1 FROM sys.fn_listextendedproperty('Description', 'SCHEMA', 'dbo', 'TABLE', 'Customers', 'COLUMN', 'City') )
	EXEC sys.sp_addextendedproperty 'Description', 'The city where the customer is located.', 'SCHEMA', 'dbo', 'TABLE', 'Customers', 'COLUMN', 'City';
IF NOT EXISTS (SELECT 1 FROM sys.fn_listextendedproperty('Description', 'SCHEMA', 'dbo', 'TABLE', 'Customers', 'COLUMN', 'PostalCode') )
	EXEC sys.sp_addextendedproperty 'Description', 'The postal code for the customer.', 'SCHEMA', 'dbo', 'TABLE', 'Customers', 'COLUMN', 'PostalCode';
IF NOT EXISTS (SELECT 1 FROM sys.fn_listextendedproperty('Description', 'SCHEMA', 'dbo', 'TABLE', 'Customers', 'COLUMN', 'Country') )
	EXEC sys.sp_addextendedproperty 'Description', 'The country where the customer is located.', 'SCHEMA', 'dbo', 'TABLE', 'Customers', 'COLUMN', 'Country';
GO

IF NOT EXISTS (SELECT 1 FROM sys.fn_listextendedproperty('Description', 'SCHEMA', 'dbo', 'TABLE', 'Employees', 'COLUMN', 'LastName') )
	EXEC sys.sp_addextendedproperty 'Description', 'The last name of the employee.', 'SCHEMA', 'dbo', 'TABLE', 'Employees', 'COLUMN', 'LastName';
IF NOT EXISTS (SELECT 1 FROM sys.fn_listextendedproperty('Description', 'SCHEMA', 'dbo', 'TABLE', 'Employees', 'COLUMN', 'FirstName') )
	EXEC sys.sp_addextendedproperty 'Description', 'The first name of the employee.', 'SCHEMA', 'dbo', 'TABLE', 'Employees', 'COLUMN', 'FirstName';
IF NOT EXISTS (SELECT 1 FROM sys.fn_listextendedproperty('Description', 'SCHEMA', 'dbo', 'TABLE', 'Employees', 'COLUMN', 'BirthDate') )
	EXEC sys.sp_addextendedproperty 'Description', 'The birth date of the employee.', 'SCHEMA', 'dbo', 'TABLE', 'Employees', 'COLUMN', 'BirthDate';
IF NOT EXISTS (SELECT 1 FROM sys.fn_listextendedproperty('Description', 'SCHEMA', 'dbo', 'TABLE', 'Employees', 'COLUMN', 'Photo') )
	EXEC sys.sp_addextendedproperty 'Description', 'The file path to the employee photo.', 'SCHEMA', 'dbo', 'TABLE', 'Employees', 'COLUMN', 'Photo';
IF NOT EXISTS (SELECT 1 FROM sys.fn_listextendedproperty('Description', 'SCHEMA', 'dbo', 'TABLE', 'Employees', 'COLUMN', 'Notes') )
	EXEC sys.sp_addextendedproperty 'Description', 'Additional notes about the employee.', 'SCHEMA', 'dbo', 'TABLE', 'Employees', 'COLUMN', 'Notes';
GO

IF NOT EXISTS (SELECT 1 FROM sys.fn_listextendedproperty('Description', 'SCHEMA', 'dbo', 'TABLE', 'OrderDetails', 'COLUMN', 'OrdID') )
	EXEC sys.sp_addextendedproperty 'Description', 'The unique identifier for the order that the order detail belongs to and references OrderID in Orders Table.', 'SCHEMA', 'dbo', 'TABLE', 'OrderDetails', 'COLUMN', 'OrdID';
IF NOT EXISTS (SELECT 1 FROM sys.fn_listextendedproperty('Description', 'SCHEMA', 'dbo', 'TABLE', 'OrderDetails', 'COLUMN', 'ProdID') )
	EXEC sys.sp_addextendedproperty 'Description', 'The unique identifier for the product that the order detail represents and references ProductID in Products Table.', 'SCHEMA', 'dbo', 'TABLE', 'OrderDetails', 'COLUMN', 'ProdID';
IF NOT EXISTS (SELECT 1 FROM sys.fn_listextendedproperty('Description', 'SCHEMA', 'dbo', 'TABLE', 'OrderDetails', 'COLUMN', 'Quantity') )
	EXEC sys.sp_addextendedproperty 'Description', 'The quantity of the product that is ordered in this order detail.', 'SCHEMA', 'dbo', 'TABLE', 'OrderDetails', 'COLUMN', 'Quantity';
GO

IF NOT EXISTS (SELECT 1 FROM sys.fn_listextendedproperty('MS_Description', 'SCHEMA', 'dbo', 'TABLE', 'Orders', 'COLUMN', 'CustID') )
	EXEC sys.sp_addextendedproperty 'MS_Description', 'The unique identifier for the customer associated with the order that references the CustomerID column in the Customers table.', 'SCHEMA', 'dbo', 'TABLE', 'Orders', 'COLUMN', 'CustID';
IF NOT EXISTS (SELECT 1 FROM sys.fn_listextendedproperty('MS_Description', 'SCHEMA', 'dbo', 'TABLE', 'Orders', 'COLUMN', 'EmpID') )
	EXEC sys.sp_addextendedproperty 'MS_Description', 'The unique identifier for the employee associated with the order that references the EmployeeID column in the Employees table.', 'SCHEMA', 'dbo', 'TABLE', 'Orders', 'COLUMN', 'EmpID';
IF NOT EXISTS (SELECT 1 FROM sys.fn_listextendedproperty('MS_Description', 'SCHEMA', 'dbo', 'TABLE', 'Orders', 'COLUMN', 'OrderDate') )
	EXEC sys.sp_addextendedproperty 'MS_Description', 'The date when the order was placed.', 'SCHEMA', 'dbo', 'TABLE', 'Orders', 'COLUMN', 'OrderDate';
IF NOT EXISTS (SELECT 1 FROM sys.fn_listextendedproperty('MS_Description', 'SCHEMA', 'dbo', 'TABLE', 'Orders', 'COLUMN', 'ShipID') )
	EXEC sys.sp_addextendedproperty 'MS_Description', 'The unique identifier for the shipper associated with the order that references the ShipperID column in the Shippers table.', 'SCHEMA', 'dbo', 'TABLE', 'Orders', 'COLUMN', 'ShipID';
GO

IF NOT EXISTS (SELECT 1 FROM sys.fn_listextendedproperty('MS_Description', 'SCHEMA', 'dbo', 'TABLE', 'Products', 'COLUMN', 'ProductName') )
	EXEC sys.sp_addextendedproperty 'MS_Description', 'The name of the product.', 'SCHEMA', 'dbo', 'TABLE', 'Products', 'COLUMN', 'ProductName';
IF NOT EXISTS (SELECT 1 FROM sys.fn_listextendedproperty('MS_Description', 'SCHEMA', 'dbo', 'TABLE', 'Products', 'COLUMN', 'SuplID') )
	EXEC sys.sp_addextendedproperty 'MS_Description', 'The unique identifier for the supplier associated with the product that references the SupplierID column in the Suppliers table.', 'SCHEMA', 'dbo', 'TABLE', 'Products', 'COLUMN', 'SuplID';
IF NOT EXISTS (SELECT 1 FROM sys.fn_listextendedproperty('MS_Description', 'SCHEMA', 'dbo', 'TABLE', 'Products', 'COLUMN', 'CatID') )
	EXEC sys.sp_addextendedproperty 'MS_Description', 'The unique identifier for the category associated with the product that references the CategoryID column in the Categories table.', 'SCHEMA', 'dbo', 'TABLE', 'Products', 'COLUMN', 'CatID';
IF NOT EXISTS (SELECT 1 FROM sys.fn_listextendedproperty('MS_Description', 'SCHEMA', 'dbo', 'TABLE', 'Products', 'COLUMN', 'Unit') )
	EXEC sys.sp_addextendedproperty 'MS_Description', 'The unit of measure for the product.', 'SCHEMA', 'dbo', 'TABLE', 'Products', 'COLUMN', 'Unit';
IF NOT EXISTS (SELECT 1 FROM sys.fn_listextendedproperty('MS_Description', 'SCHEMA', 'dbo', 'TABLE', 'Products', 'COLUMN', 'Price') )
	EXEC sys.sp_addextendedproperty 'MS_Description', 'The price of the product.', 'SCHEMA', 'dbo', 'TABLE', 'Products', 'COLUMN', 'Price';
GO

IF NOT EXISTS (SELECT 1 FROM sys.fn_listextendedproperty('Description', 'SCHEMA', 'dbo', 'TABLE', 'Shippers', 'COLUMN', 'ShipperName') )
	EXEC sys.sp_addextendedproperty 'Description', 'The name of the shipper.', 'SCHEMA', 'dbo', 'TABLE', 'Shippers', 'COLUMN', 'ShipperName';
IF NOT EXISTS (SELECT 1 FROM sys.fn_listextendedproperty('Description', 'SCHEMA', 'dbo', 'TABLE', 'Shippers', 'COLUMN', 'Phone') )
	EXEC sys.sp_addextendedproperty 'Description', 'The phone number for the shipper.', 'SCHEMA', 'dbo', 'TABLE', 'Shippers', 'COLUMN', 'Phone';
GO

IF NOT EXISTS (SELECT 1 FROM sys.fn_listextendedproperty('Description', 'SCHEMA', 'dbo', 'TABLE', 'Suppliers', 'COLUMN', 'SupplierName') )
	EXEC sys.sp_addextendedproperty 'Description', 'The name of the supplier.', 'SCHEMA', 'dbo', 'TABLE', 'Suppliers', 'COLUMN', 'SupplierName';
IF NOT EXISTS (SELECT 1 FROM sys.fn_listextendedproperty('Description', 'SCHEMA', 'dbo', 'TABLE', 'Suppliers', 'COLUMN', 'ContactName') )
	EXEC sys.sp_addextendedproperty 'Description', 'The contact person for the supplier.', 'SCHEMA', 'dbo', 'TABLE', 'Suppliers', 'COLUMN', 'ContactName';
IF NOT EXISTS (SELECT 1 FROM sys.fn_listextendedproperty('Description', 'SCHEMA', 'dbo', 'TABLE', 'Suppliers', 'COLUMN', 'Address') )
	EXEC sys.sp_addextendedproperty 'Description', 'The address of the supplier.', 'SCHEMA', 'dbo', 'TABLE', 'Suppliers', 'COLUMN', 'Address';
IF NOT EXISTS (SELECT 1 FROM sys.fn_listextendedproperty('Description', 'SCHEMA', 'dbo', 'TABLE', 'Suppliers', 'COLUMN', 'City') )
	EXEC sys.sp_addextendedproperty 'Description', 'The city where the supplier is located.', 'SCHEMA', 'dbo', 'TABLE', 'Suppliers', 'COLUMN', 'City';
IF NOT EXISTS (SELECT 1 FROM sys.fn_listextendedproperty('Description', 'SCHEMA', 'dbo', 'TABLE', 'Suppliers', 'COLUMN', 'PostalCode') )
	EXEC sys.sp_addextendedproperty 'Description', 'The postal code for the supplier.', 'SCHEMA', 'dbo', 'TABLE', 'Suppliers', 'COLUMN', 'PostalCode';
IF NOT EXISTS (SELECT 1 FROM sys.fn_listextendedproperty('Description', 'SCHEMA', 'dbo', 'TABLE', 'Suppliers', 'COLUMN', 'Country') )
	EXEC sys.sp_addextendedproperty 'Description', 'The country where the supplier is located.', 'SCHEMA', 'dbo', 'TABLE', 'Suppliers', 'COLUMN', 'Country';
GO