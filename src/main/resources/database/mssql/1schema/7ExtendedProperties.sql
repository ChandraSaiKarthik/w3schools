USE [<<Database>>];
GO

IF NOT EXISTS (SELECT 1 FROM fn_listextendedproperty('Description', 'SCHEMA', 'dbo', 'TABLE', 'Categories', 'COLUMN', 'CategoryName'))  EXEC sp_addextendedproperty 'Description', 'The name of the category.', 'SCHEMA', 'dbo', 'TABLE', 'Categories', 'COLUMN', 'CategoryName';
IF NOT EXISTS (SELECT 1 FROM fn_listextendedproperty('Description', 'SCHEMA', 'dbo', 'TABLE', 'Categories', 'COLUMN', 'Description'))  EXEC sp_addextendedproperty 'Description', 'A brief description of the category.', 'SCHEMA', 'dbo', 'TABLE', 'Categories', 'COLUMN', 'Description';
GO

IF NOT EXISTS (SELECT 1 FROM fn_listextendedproperty('Description', 'SCHEMA', 'dbo', 'TABLE', 'Customers', 'COLUMN', 'CustomerName'))  EXEC sp_addextendedproperty 'Description', 'The name of the customer.', 'SCHEMA', 'dbo', 'TABLE', 'Customers', 'COLUMN', 'CustomerName';
IF NOT EXISTS (SELECT 1 FROM fn_listextendedproperty('Description', 'SCHEMA', 'dbo', 'TABLE', 'Customers', 'COLUMN', 'ContactName'))  EXEC sp_addextendedproperty 'Description', 'The name of the contact person for the customer.', 'SCHEMA', 'dbo', 'TABLE', 'Customers', 'COLUMN', 'ContactName';
IF NOT EXISTS (SELECT 1 FROM fn_listextendedproperty('Description', 'SCHEMA', 'dbo', 'TABLE', 'Customers', 'COLUMN', 'Address'))  EXEC sp_addextendedproperty 'Description', 'The address of the customer.', 'SCHEMA', 'dbo', 'TABLE', 'Customers', 'COLUMN', 'Address';
IF NOT EXISTS (SELECT 1 FROM fn_listextendedproperty('Description', 'SCHEMA', 'dbo', 'TABLE', 'Customers', 'COLUMN', 'City'))  EXEC sp_addextendedproperty 'Description', 'The city where the customer is located.', 'SCHEMA', 'dbo', 'TABLE', 'Customers', 'COLUMN', 'City';
IF NOT EXISTS (SELECT 1 FROM fn_listextendedproperty('Description', 'SCHEMA', 'dbo', 'TABLE', 'Customers', 'COLUMN', 'PostalCode'))  EXEC sp_addextendedproperty 'Description', 'The postal code for the customer.', 'SCHEMA', 'dbo', 'TABLE', 'Customers', 'COLUMN', 'PostalCode';
IF NOT EXISTS (SELECT 1 FROM fn_listextendedproperty('Description', 'SCHEMA', 'dbo', 'TABLE', 'Customers', 'COLUMN', 'Country'))  EXEC sp_addextendedproperty 'Description', 'The country where the customer is located.', 'SCHEMA', 'dbo', 'TABLE', 'Customers', 'COLUMN', 'Country';
GO

IF NOT EXISTS (SELECT 1 FROM fn_listextendedproperty('Description', 'SCHEMA', 'dbo', 'TABLE', 'Employees', 'COLUMN', 'LastName'))  EXEC sp_addextendedproperty 'Description', 'The last name of the employee.', 'SCHEMA', 'dbo', 'TABLE', 'Employees', 'COLUMN', 'LastName';
IF NOT EXISTS (SELECT 1 FROM fn_listextendedproperty('Description', 'SCHEMA', 'dbo', 'TABLE', 'Employees', 'COLUMN', 'FirstName'))  EXEC sp_addextendedproperty 'Description', 'The first name of the employee.', 'SCHEMA', 'dbo', 'TABLE', 'Employees', 'COLUMN', 'FirstName';
IF NOT EXISTS (SELECT 1 FROM fn_listextendedproperty('Description', 'SCHEMA', 'dbo', 'TABLE', 'Employees', 'COLUMN', 'BirthDate'))  EXEC sp_addextendedproperty 'Description', 'The birth date of the employee.', 'SCHEMA', 'dbo', 'TABLE', 'Employees', 'COLUMN', 'BirthDate';
IF NOT EXISTS (SELECT 1 FROM fn_listextendedproperty('Description', 'SCHEMA', 'dbo', 'TABLE', 'Employees', 'COLUMN', 'Photo'))  EXEC sp_addextendedproperty 'Description', 'The file path to the employee photo.', 'SCHEMA', 'dbo', 'TABLE', 'Employees', 'COLUMN', 'Photo';
IF NOT EXISTS (SELECT 1 FROM fn_listextendedproperty('Description', 'SCHEMA', 'dbo', 'TABLE', 'Employees', 'COLUMN', 'Notes'))  EXEC sp_addextendedproperty 'Description', 'Additional notes about the employee.', 'SCHEMA', 'dbo', 'TABLE', 'Employees', 'COLUMN', 'Notes';
GO

IF NOT EXISTS (SELECT 1 FROM fn_listextendedproperty('Description', 'SCHEMA', 'dbo', 'TABLE', 'OrderDetails', 'COLUMN', 'OrderID'))  EXEC sp_addextendedproperty 'Description', 'The unique identifier for the order that the order detail belongs to and references OrderID in Orders Table.', 'SCHEMA', 'dbo', 'TABLE', 'OrderDetails', 'COLUMN', 'OrderID';
IF NOT EXISTS (SELECT 1 FROM fn_listextendedproperty('Description', 'SCHEMA', 'dbo', 'TABLE', 'OrderDetails', 'COLUMN', 'ProductID'))  EXEC sp_addextendedproperty 'Description', 'The unique identifier for the product that the order detail represents and references ProductID in Products Table.', 'SCHEMA', 'dbo', 'TABLE', 'OrderDetails', 'COLUMN', 'ProductID';
IF NOT EXISTS (SELECT 1 FROM fn_listextendedproperty('Description', 'SCHEMA', 'dbo', 'TABLE', 'OrderDetails', 'COLUMN', 'Quantity'))  EXEC sp_addextendedproperty 'Description', 'The quantity of the product that is ordered in this order detail.', 'SCHEMA', 'dbo', 'TABLE', 'OrderDetails', 'COLUMN', 'Quantity';
GO

IF NOT EXISTS (SELECT 1 FROM fn_listextendedproperty('MS_Description', 'SCHEMA', 'dbo', 'TABLE', 'Orders', 'COLUMN', 'CustomerID'))  EXEC sp_addextendedproperty 'MS_Description', 'The unique identifier for the customer associated with the order that references the CustomerID column in the Customers table.', 'SCHEMA', 'dbo', 'TABLE', 'Orders', 'COLUMN', 'CustomerID';
IF NOT EXISTS (SELECT 1 FROM fn_listextendedproperty('MS_Description', 'SCHEMA', 'dbo', 'TABLE', 'Orders', 'COLUMN', 'EmployeeID'))  EXEC sp_addextendedproperty 'MS_Description', 'The unique identifier for the employee associated with the order that references the EmployeeID column in the Employees table.', 'SCHEMA', 'dbo', 'TABLE', 'Orders', 'COLUMN', 'EmployeeID';
IF NOT EXISTS (SELECT 1 FROM fn_listextendedproperty('MS_Description', 'SCHEMA', 'dbo', 'TABLE', 'Orders', 'COLUMN', 'OrderDate'))  EXEC sp_addextendedproperty 'MS_Description', 'The date when the order was placed.', 'SCHEMA', 'dbo', 'TABLE', 'Orders', 'COLUMN', 'OrderDate';
IF NOT EXISTS (SELECT 1 FROM fn_listextendedproperty('MS_Description', 'SCHEMA', 'dbo', 'TABLE', 'Orders', 'COLUMN', 'ShipperID'))  EXEC sp_addextendedproperty 'MS_Description', 'The unique identifier for the shipper associated with the order that references the ShipperID column in the Shippers table.', 'SCHEMA', 'dbo', 'TABLE', 'Orders', 'COLUMN', 'ShipperID';
GO

IF NOT EXISTS (SELECT 1 FROM fn_listextendedproperty('MS_Description', 'SCHEMA', 'dbo', 'TABLE', 'Products', 'COLUMN', 'ProductName'))  EXEC sp_addextendedproperty 'MS_Description', 'The name of the product.', 'SCHEMA', 'dbo', 'TABLE', 'Products', 'COLUMN', 'ProductName';
IF NOT EXISTS (SELECT 1 FROM fn_listextendedproperty('MS_Description', 'SCHEMA', 'dbo', 'TABLE', 'Products', 'COLUMN', 'SupplierID'))  EXEC sp_addextendedproperty 'MS_Description', 'The unique identifier for the supplier associated with the product that references the SupplierID column in the Suppliers table.', 'SCHEMA', 'dbo', 'TABLE', 'Products', 'COLUMN', 'SupplierID';
IF NOT EXISTS (SELECT 1 FROM fn_listextendedproperty('MS_Description', 'SCHEMA', 'dbo', 'TABLE', 'Products', 'COLUMN', 'CategoryID'))  EXEC sp_addextendedproperty 'MS_Description', 'The unique identifier for the category associated with the product that references the CategoryID column in the Categories table.', 'SCHEMA', 'dbo', 'TABLE', 'Products', 'COLUMN', 'CategoryID';
IF NOT EXISTS (SELECT 1 FROM fn_listextendedproperty('MS_Description', 'SCHEMA', 'dbo', 'TABLE', 'Products', 'COLUMN', 'Unit'))  EXEC sp_addextendedproperty 'MS_Description', 'The unit of measure for the product.', 'SCHEMA', 'dbo', 'TABLE', 'Products', 'COLUMN', 'Unit';
IF NOT EXISTS (SELECT 1 FROM fn_listextendedproperty('MS_Description', 'SCHEMA', 'dbo', 'TABLE', 'Products', 'COLUMN', 'Price'))  EXEC sp_addextendedproperty 'MS_Description', 'The price of the product.', 'SCHEMA', 'dbo', 'TABLE', 'Products', 'COLUMN', 'Price';
GO

IF NOT EXISTS (SELECT 1 FROM fn_listextendedproperty('Description', 'SCHEMA', 'dbo', 'TABLE', 'Shippers', 'COLUMN', 'ShipperName'))  EXEC sp_addextendedproperty 'Description', 'The name of the shipper.', 'SCHEMA', 'dbo', 'TABLE', 'Shippers', 'COLUMN', 'ShipperName';
IF NOT EXISTS (SELECT 1 FROM fn_listextendedproperty('Description', 'SCHEMA', 'dbo', 'TABLE', 'Shippers', 'COLUMN', 'Phone'))  EXEC sp_addextendedproperty 'Description', 'The phone number for the shipper.', 'SCHEMA', 'dbo', 'TABLE', 'Shippers', 'COLUMN', 'Phone';
GO

IF NOT EXISTS (SELECT 1 FROM fn_listextendedproperty('Description', 'SCHEMA', 'dbo', 'TABLE', 'Suppliers', 'COLUMN', 'SupplierName'))  EXEC sp_addextendedproperty 'Description', 'The name of the supplier.', 'SCHEMA', 'dbo', 'TABLE', 'Suppliers', 'COLUMN', 'SupplierName';
IF NOT EXISTS (SELECT 1 FROM fn_listextendedproperty('Description', 'SCHEMA', 'dbo', 'TABLE', 'Suppliers', 'COLUMN', 'ContactName'))  EXEC sp_addextendedproperty 'Description', 'The contact person for the supplier.', 'SCHEMA', 'dbo', 'TABLE', 'Suppliers', 'COLUMN', 'ContactName';
IF NOT EXISTS (SELECT 1 FROM fn_listextendedproperty('Description', 'SCHEMA', 'dbo', 'TABLE', 'Suppliers', 'COLUMN', 'Address'))  EXEC sp_addextendedproperty 'Description', 'The address of the supplier.', 'SCHEMA', 'dbo', 'TABLE', 'Suppliers', 'COLUMN', 'Address';
IF NOT EXISTS (SELECT 1 FROM fn_listextendedproperty('Description', 'SCHEMA', 'dbo', 'TABLE', 'Suppliers', 'COLUMN', 'City'))  EXEC sp_addextendedproperty 'Description', 'The city where the supplier is located.', 'SCHEMA', 'dbo', 'TABLE', 'Suppliers', 'COLUMN', 'City';
IF NOT EXISTS (SELECT 1 FROM fn_listextendedproperty('Description', 'SCHEMA', 'dbo', 'TABLE', 'Suppliers', 'COLUMN', 'PostalCode'))  EXEC sp_addextendedproperty 'Description', 'The postal code for the supplier.', 'SCHEMA', 'dbo', 'TABLE', 'Suppliers', 'COLUMN', 'PostalCode';
IF NOT EXISTS (SELECT 1 FROM fn_listextendedproperty('Description', 'SCHEMA', 'dbo', 'TABLE', 'Suppliers', 'COLUMN', 'Country'))  EXEC sp_addextendedproperty 'Description', 'The country where the supplier is located.', 'SCHEMA', 'dbo', 'TABLE', 'Suppliers', 'COLUMN', 'Country';
GO
