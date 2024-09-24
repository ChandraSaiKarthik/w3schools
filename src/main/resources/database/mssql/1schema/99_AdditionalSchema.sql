USE [<<Database>>];
GO

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'log')
	EXECUTE('CREATE SCHEMA [log]');
GO

-- Actions Table
IF OBJECT_ID(N'[log].[Actions]', 'U') IS NULL 
    CREATE TABLE [log].[Actions] 
    (
        [ActionID] int IDENTITY(1,1),
        [EntityType] varchar(20) NOT NULL, -- 'Customer' or 'Supplier'
        [EntityID] int NOT NULL,
        [ActionDescription] varchar(200) NULL,
        CONSTRAINT [PK_ActionID] PRIMARY KEY CLUSTERED ([ActionID]),

        -- Foreign Key to Customers table
        CONSTRAINT [FK_Actions_Customers] FOREIGN KEY ([EntityID]) REFERENCES [dbo].[Customers] ([CustomerID]),

        -- Foreign Key to Suppliers table
        CONSTRAINT [FK_Actions_Suppliers] FOREIGN KEY ([EntityID]) REFERENCES [dbo].[Suppliers] ([SupplierID])
    ); /*LVL:1*/