IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'product')
	EXECUTE('CREATE SCHEMA [product]');
GO

--$BeginRegion: BaseTable product.Categories
IF NOT EXISTS (SELECT * FROM sys.tables WHERE object_id=OBJECT_ID('[product].[Categories]'))
BEGIN
	CREATE TABLE product.Categories
	(
		CategoryID INT NOT NULL IDENTITY(1,1),
		CategoryName VARCHAR(50) NULL,
		Description VARCHAR(100) NULL
	) ON [PRIMARY];
	--
	EXEC sys.sp_addextendedproperty 'Description', 'The unique identifier for each category.', 'SCHEMA', 'product', 'TABLE', 'Categories', 'COLUMN', 'CategoryID';
	EXEC sys.sp_addextendedproperty 'Description', 'The name of the category.', 'SCHEMA', 'product', 'TABLE', 'Categories', 'COLUMN', 'CategoryName';
	EXEC sys.sp_addextendedproperty 'Description', 'A brief description of the category.', 'SCHEMA', 'product', 'TABLE', 'Categories', 'COLUMN', 'Description';
END;
--$EndRegion: BaseTable product.Categories

--$BeginRegion: BaseTable product.Suppliers
IF NOT EXISTS (SELECT * FROM sys.tables WHERE object_id=OBJECT_ID('[product].[Suppliers]'))
BEGIN
	CREATE TABLE product.Suppliers
	(
		SupplierID INT NOT NULL IDENTITY(1,1),
		SupplierName VARCHAR(50) NULL,
		ContactName VARCHAR(50) NULL,
		Address VARCHAR(50) NULL,
		City VARCHAR(50) NULL,
		PostalCode VARCHAR(50) NULL,
		Country VARCHAR(50) NULL
	) ON [PRIMARY];
	--
	EXEC sys.sp_addextendedproperty 'Description', 'The unique identifier for each supplier.', 'SCHEMA', 'product', 'TABLE', 'Suppliers', 'COLUMN', 'SupplierID';
	EXEC sys.sp_addextendedproperty 'Description', 'The name of the supplier.', 'SCHEMA', 'product', 'TABLE', 'Suppliers', 'COLUMN', 'SupplierName';
	EXEC sys.sp_addextendedproperty 'Description', 'The contact person for the supplier.', 'SCHEMA', 'product', 'TABLE', 'Suppliers', 'COLUMN', 'ContactName';
	EXEC sys.sp_addextendedproperty 'Description', 'The address of the supplier.', 'SCHEMA', 'product', 'TABLE', 'Suppliers', 'COLUMN', 'Address';
	EXEC sys.sp_addextendedproperty 'Description', 'The city where the supplier is located.', 'SCHEMA', 'product', 'TABLE', 'Suppliers', 'COLUMN', 'City';
	EXEC sys.sp_addextendedproperty 'Description', 'The postal code for the supplier.', 'SCHEMA', 'product', 'TABLE', 'Suppliers', 'COLUMN', 'PostalCode';
	EXEC sys.sp_addextendedproperty 'Description', 'The country where the supplier is located.', 'SCHEMA', 'product', 'TABLE', 'Suppliers', 'COLUMN', 'Country';
END;
--$EndRegion: BaseTable product.Suppliers

--$BeginRegion: BaseTable product.Products
IF NOT EXISTS (SELECT * FROM sys.tables WHERE object_id=OBJECT_ID('[product].[Products]'))
BEGIN
	CREATE TABLE product.Products
	(
		ProductID INT NOT NULL IDENTITY(1,1),
		ProductName VARCHAR(50) NULL,
		SupplierID INT NULL,
		CategoryID INT NULL,
		Unit VARCHAR(50) NULL,
		Price DECIMAL(18,2) NULL
	) ON [PRIMARY];
	--
	EXEC sys.sp_addextendedproperty 'MS_Description', 'The unique identifier for each product.', 'SCHEMA', 'product', 'TABLE', 'Products', 'COLUMN', 'ProductID';
	EXEC sys.sp_addextendedproperty 'MS_Description', 'The name of the product.', 'SCHEMA', 'product', 'TABLE', 'Products', 'COLUMN', 'ProductName';
	EXEC sys.sp_addextendedproperty 'MS_Description', 'The unique identifier for the supplier associated with the product that references the SupplierID column in the Suppliers table.', 'SCHEMA', 'product', 'TABLE', 'Products', 'COLUMN', 'SupplierID';
	EXEC sys.sp_addextendedproperty 'MS_Description', 'The unique identifier for the category associated with the product that references the CategoryID column in the Categories table.', 'SCHEMA', 'product', 'TABLE', 'Products', 'COLUMN', 'CategoryID';
	EXEC sys.sp_addextendedproperty 'MS_Description', 'The unit of measure for the product.', 'SCHEMA', 'product', 'TABLE', 'Products', 'COLUMN', 'Unit';
	EXEC sys.sp_addextendedproperty 'MS_Description', 'The price of the product.', 'SCHEMA', 'product', 'TABLE', 'Products', 'COLUMN', 'Price';
END;
--$EndRegion: BaseTable product.Products
GO

--$BeginRegion: PrimaryKey Constraint product.Categories
IF NOT EXISTS (SELECT * FROM sys.key_constraints WHERE name = 'PK_CategoryID' AND type = 'PK')
BEGIN
	ALTER TABLE product.Categories ALTER COLUMN CategoryID INT NOT NULL;
	EXEC ('ALTER TABLE product.Categories ADD CONSTRAINT PK_CategoryID PRIMARY KEY CLUSTERED(CategoryID);');
END;
--$EndRegion: PrimaryKey Constraint product.Categories

--$BeginRegion: PrimaryKey Constraint product.Suppliers
IF NOT EXISTS (SELECT * FROM sys.key_constraints WHERE name = 'PK_SupplierID' AND type = 'PK')
BEGIN
	ALTER TABLE product.Suppliers ALTER COLUMN SupplierID INT NOT NULL;
	EXEC ('ALTER TABLE product.Suppliers ADD CONSTRAINT PK_SupplierID PRIMARY KEY CLUSTERED(SupplierID);');
END;
--$EndRegion: PrimaryKey Constraint product.Suppliers

--$BeginRegion: PrimaryKey Constraint product.Products
IF NOT EXISTS (SELECT * FROM sys.key_constraints WHERE name = 'PK_ProductID' AND type = 'PK')
BEGIN
	ALTER TABLE product.Products ALTER COLUMN ProductID INT NOT NULL;
	EXEC ('ALTER TABLE product.Products ADD CONSTRAINT PK_ProductID PRIMARY KEY CLUSTERED(ProductID);');
END;
--$EndRegion: PrimaryKey Constraint product.Products
GO

--$BeginRegion: UniqueKey Constraint product.Categories
IF NOT EXISTS (SELECT * FROM sys.key_constraints WHERE name = 'UK_CategoryName' AND type = 'UQ')
BEGIN
	ALTER TABLE product.Categories ADD CONSTRAINT UK_CategoryName UNIQUE (CategoryName);
END;
--$EndRegion: UniqueKey Constraint product.Categories

--$BeginRegion: UniqueKey Constraint product.Suppliers
IF NOT EXISTS (SELECT * FROM sys.key_constraints WHERE name = 'UK_SupplierName' AND type = 'UQ')
BEGIN
	ALTER TABLE product.Suppliers ADD CONSTRAINT UK_SupplierName UNIQUE (SupplierName);
END;
--$EndRegion: UniqueKey Constraint product.Suppliers

--$BeginRegion: UniqueKey Constraint product.Products
IF NOT EXISTS (SELECT * FROM sys.key_constraints WHERE name = 'UK_ProductName' AND type = 'UQ')
BEGIN
	ALTER TABLE product.Products ADD CONSTRAINT UK_ProductName UNIQUE (ProductName);
END;
--$EndRegion: UniqueKey Constraint product.Products
GO

--$BeginRegion: ForeignKey Constraints product.Products
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'Products.CategoryID=Categories.CategoryID')
BEGIN
	ALTER TABLE product.Products WITH NOCHECK
		ADD CONSTRAINT [Products.CategoryID=Categories.CategoryID]
			FOREIGN KEY (CategoryID)
				REFERENCES product.Categories (CategoryID) ON UPDATE CASCADE ON DELETE CASCADE;
	--
	ALTER TABLE product.Products WITH CHECK CHECK CONSTRAINT [Products.CategoryID=Categories.CategoryID];
END;
--
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'Products.SupplierID=Suppliers.SupplierID')
BEGIN
	ALTER TABLE product.Products WITH NOCHECK
		ADD CONSTRAINT [Products.SupplierID=Suppliers.SupplierID]
			FOREIGN KEY (SupplierID)
				REFERENCES product.Suppliers (SupplierID) ON UPDATE CASCADE ON DELETE CASCADE;
	--
	ALTER TABLE product.Products WITH CHECK CHECK CONSTRAINT [Products.SupplierID=Suppliers.SupplierID];
END;
--$EndRegion: ForeignKey Constraints product.Products
GO