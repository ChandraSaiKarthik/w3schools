USE [<<Database>>];
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'Products.CategoryID=Categories.CategoryID')
BEGIN
	ALTER TABLE dbo.Products WITH NOCHECK
		ADD CONSTRAINT [Products.CategoryID=Categories.CategoryID]
			FOREIGN KEY (CategoryID)
				REFERENCES dbo.Categories (CategoryID) ON UPDATE CASCADE ON DELETE CASCADE;
	--
	ALTER TABLE dbo.Products WITH CHECK CHECK CONSTRAINT [Products.CategoryID=Categories.CategoryID];
END;
--
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'Products.SupplierID=Suppliers.SupplierID')
BEGIN
	ALTER TABLE dbo.Products WITH NOCHECK
		ADD CONSTRAINT [Products.SupplierID=Suppliers.SupplierID]
			FOREIGN KEY (SupplierID)
				REFERENCES dbo.Suppliers (SupplierID) ON UPDATE CASCADE ON DELETE CASCADE;
	--
	ALTER TABLE dbo.Products WITH CHECK CHECK CONSTRAINT [Products.SupplierID=Suppliers.SupplierID];
END;
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'Orders.CustomerID=Customers.CustomerID')
BEGIN
	ALTER TABLE dbo.Orders WITH NOCHECK
		ADD CONSTRAINT [Orders.CustomerID=Customers.CustomerID]
			FOREIGN KEY (CustomerID)
				REFERENCES dbo.Customers (CustomerID) ON UPDATE CASCADE ON DELETE CASCADE;
	--
	ALTER TABLE dbo.Orders WITH CHECK CHECK CONSTRAINT [Orders.CustomerID=Customers.CustomerID];
END;
--
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'Orders.EmployeeID=Employees.EmployeeID')
BEGIN
	ALTER TABLE dbo.Orders WITH NOCHECK
		ADD CONSTRAINT [Orders.EmployeeID=Employees.EmployeeID]
			FOREIGN KEY (EmployeeID)
				REFERENCES dbo.Employees (EmployeeID) ON UPDATE CASCADE ON DELETE CASCADE;
	--
	ALTER TABLE dbo.Orders WITH CHECK CHECK CONSTRAINT [Orders.EmployeeID=Employees.EmployeeID];
END;
--
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'Orders.ShipperID=Shippers.ShipperID')
BEGIN
	ALTER TABLE dbo.Orders WITH NOCHECK
		ADD CONSTRAINT [Orders.ShipperID=Shippers.ShipperID]
			FOREIGN KEY (ShipperID)
				REFERENCES dbo.Shippers (ShipperID) ON UPDATE CASCADE ON DELETE CASCADE;
	--
	ALTER TABLE dbo.Orders WITH CHECK CHECK CONSTRAINT [Orders.ShipperID=Shippers.ShipperID];
END;
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'OrderDetails.OrderID=Orders.OrderID')
BEGIN
	ALTER TABLE dbo.OrderDetails WITH NOCHECK
		ADD CONSTRAINT [OrderDetails.OrderID=Orders.OrderID]
			FOREIGN KEY (OrderID)
				REFERENCES dbo.Orders (OrderID) ON UPDATE CASCADE ON DELETE CASCADE;
	--
	ALTER TABLE dbo.OrderDetails WITH CHECK CHECK CONSTRAINT [OrderDetails.OrderID=Orders.OrderID];
END;
--
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'OrderDetails.ProductID=Products.ProductID')
BEGIN
	ALTER TABLE dbo.OrderDetails WITH NOCHECK
		ADD CONSTRAINT [OrderDetails.ProductID=Products.ProductID]
			FOREIGN KEY (ProductID)
				REFERENCES dbo.Products (ProductID) ON UPDATE CASCADE ON DELETE CASCADE;
	--
	ALTER TABLE dbo.OrderDetails WITH CHECK CHECK CONSTRAINT [OrderDetails.ProductID=Products.ProductID];
END;
GO
