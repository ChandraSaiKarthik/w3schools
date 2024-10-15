USE [<<Database>>];
GO

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'log')
    EXECUTE('CREATE SCHEMA [log]');
GO

DROP TABLE IF EXISTS [log].[Actions];
GO

-- Actions Table
IF OBJECT_ID(N'[log].[Actions]', 'U') IS NULL 
    CREATE TABLE [log].[Actions] 
    (
        [ActionID] int IDENTITY(1,1),
        [EntityType] varchar(20) NULL CONSTRAINT [DF_EntityType] DEFAULT ('Customer') CONSTRAINT [CC_Actions_EntityType] CHECK ([EntityType] IN ('Customer', 'Supplier')), -- 'Customer' or 'Supplier'
        [EntityID] int NULL,
        [ActionDescription] varchar(200) NULL,
        [CreatedOn] datetime NULL CONSTRAINT [DF_CreatedOn] DEFAULT GETDATE(),
        [CreatedBy] varchar(50) CONSTRAINT [DF_CreatedBy] DEFAULT SUSER_NAME(),
        [ModifiedOn] datetime2(5) NULL CONSTRAINT [DF_ModifiedOn] DEFAULT GETDATE(),
        [ModifiedBy] nvarchar(50) CONSTRAINT [DF_ModifiedBy] DEFAULT SUSER_NAME(),
        [EntityIdentifier] AS (CONCAT([EntityType], ':',[EntityID])),
        [IsActive] bit CONSTRAINT [CC_Actions_IsActive] CHECK ([IsActive] IN (0, 1)),
        [IsPassive] bit CONSTRAINT [DF_IsPassive] DEFAULT 0,
        [Remarks] nvarchar(max) NULL,

        -- Primary Key
        CONSTRAINT [PK_ActionID] PRIMARY KEY CLUSTERED ([ActionID]),

        -- Foreign Key to Customers table
        CONSTRAINT [FK_Actions_Customers] FOREIGN KEY ([EntityID]) REFERENCES [dbo].[Customers] ([CustomerID]),

        -- Foreign Key to Suppliers table
        CONSTRAINT [FK_Actions_Suppliers] FOREIGN KEY ([EntityID]) REFERENCES [dbo].[Suppliers] ([SupplierID])
    ); /*LVL:1*/
GO


DROP TABLE IF EXISTS [log].[DataTypes];
GO

IF OBJECT_ID(N'[log].[DataTypes]', 'U') IS NULL
	CREATE TABLE log.DataTypes
	(
		Data_Type VARCHAR(128) NOT NULL,
		MSSQL_server VARCHAR(128) NOT NULL,
		PGSQL_server VARCHAR(128) NOT NULL
	); /*LVL:0*/
GO


DROP TABLE IF EXISTS [log].[SpecialDataTypes];
GO

IF OBJECT_ID(N'[log].[SpecialDataTypes]', 'U') IS NULL
    CREATE TABLE log.SpecialDataTypes
    (
        ID INT IDENTITY(1,1) PRIMARY KEY,
        HierarchyID HIERARCHYID NOT NULL,
        Geometry GEOMETRY NOT NULL,
        Geography GEOGRAPHY NOT NULL
    ); /*LVL:0*/
GO