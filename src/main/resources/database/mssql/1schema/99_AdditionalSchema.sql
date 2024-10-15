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
        [CreatedOn] datetime NULL CONSTRAINT [DF_CreatedOn] DEFAULT GETDATE() CONSTRAINT [CC_Actions_CreatedOn] CHECK ([CreatedOn] <= GETDATE()),
        [CreatedBy] varchar(50) CONSTRAINT [DF_CreatedBy] DEFAULT SUSER_NAME(),
        [ModifiedOn] datetime2(5) NULL CONSTRAINT [DF_ModifiedOn] DEFAULT GETDATE() CONSTRAINT [CC_Actions_ModifiedOn] CHECK ([ModifiedOn] <= GETDATE()),
        [ModifiedBy] nvarchar(50) CONSTRAINT [DF_ModifiedBy] DEFAULT SUSER_NAME(),
        [EntityIdentifier] AS (CONCAT([EntityType], ':',[EntityID])),
        [IsActive] bit CONSTRAINT [CC_Actions_IsActive] CHECK ([IsActive] IN (0, 1)),
        [IsPassive] bit CONSTRAINT [DF_IsPassive] DEFAULT 0,
        [AdditionalInfo] nvarchar(max) NULL,
        [Hierarchy] hierarchyid NULL,
        [Location] geography NULL,

        -- Primary Key
        CONSTRAINT [PK_ActionID] PRIMARY KEY CLUSTERED ([ActionID]),

        -- Foreign Key to Customers table
        CONSTRAINT [FK_Actions_Customers] FOREIGN KEY ([EntityID]) REFERENCES [dbo].[Customers] ([CustomerID]),

        -- Foreign Key to Suppliers table
        CONSTRAINT [FK_Actions_Suppliers] FOREIGN KEY ([EntityID]) REFERENCES [dbo].[Suppliers] ([SupplierID])
    ); /*LVL:1*/
GO

DROP TABLE IF EXISTS [dbo].[DataTypes];
GO

IF OBJECT_ID(N'[dbo].[DataTypes]', 'U') IS NULL
	CREATE TABLE dbo.DataTypes
	(
		Data_Type VARCHAR(128) NOT NULL,
		MSSQL_server VARCHAR(128) NOT NULL,
		PGSQL_server VARCHAR(128) NOT NULL
	); /*LVL:0*/
GO

MERGE INTO [dbo].[DataTypes] AS T
USING (
		VALUES
			 ('1, 0 or NULL','BIT','BOOLEAN')
			,('32 bit integer','INTEGER','INTEGER')
			,('64-bit integer','BIGINT','BIGINT')
			,('Automatically updated binary data','ROWVERSION','BYTEA')
			,('Currency amount (32 bit)','SMALLMONEY','MONEY')
			,('Date and time','SMALLDATETIME','TIMESTAMP(0)')
			,('Date and time with fractional seconds','DATETIME, DATETIME2(p)','TIMESTAMP(p)')
			,('Date and time with time zone','DATETIMEOFFSET(p)','TIMESTAMP(p) WITH TIME ZONE')
			,('Date includes year, month, and day','DATE','DATE')
			,('Double precision floating point number','DOUBLE PRECISION','DOUBLE PRECISION')
			,('Fixed length byte string','BINARY(n)','BYTEA')
			,('Fixed length char string, 1 <= n <=8000','CHAR(n)','CHAR(n)')
			,('Fixed point number','NUMERIC(p,s)','NUMERIC(p,s)')
			,('Floating point number','FLOAT(p)','DOUBLE PRECISION')
			,('Geometric types','GEOMETRY','POINT, LINE, LSEG, BOX, PATH, POLYGON, CIRCLE')
			,('Unsigned integer, 0 to 255 (8 bit)','TINYINT','SMALLINT')
			,('UUID (16 byte)','UNIQUEIDENTIFIER','CHAR(16)')
			,('Variable length binary data, <= 2GB','IMAGE','BYTEA')
			,('Variable length byte string, <= 2GB','VARBINARY(max)','BYTEA')
			,('Variable length byte string, 1 <= n <=8000','VARBINARY(n)','BYTEA')
			,('Variable length char string, <= 2GB','VARCHAR(max)','TEXT')
			,('Variable length char string, 1 <= n <=8000','VARCHAR(n)','VARCHAR(n)')
			,('Variable length character data, <= 2GB','TEXT','TEXT')
			,('Variable length Unicode UCS-2 data, <= 2GB','NTEXT','TEXT')
			,('Variable length Unicode UCS-2 data, <= 2GB','NVARCHAR(max)','TEXT')
			,('Variable length Unicode UCS-2 string','NVARCHAR(n)','VARCHAR(n)')
	  ) AS S ([Data_Type], [MSSQL_server], [PGSQL_server])
	ON ISNULL(T.[Data_Type], '') = ISNULL(S.[Data_Type], '') AND ISNULL(T.[MSSQL_server], '') = ISNULL(S.[MSSQL_server], '') AND ISNULL(T.[PGSQL_server], '') = ISNULL(S.[PGSQL_server], '')
WHEN NOT MATCHED BY TARGET 
	THEN INSERT ([Data_Type], [MSSQL_server], [PGSQL_server])
		 VALUES (S.[Data_Type], S.[MSSQL_server], S.[PGSQL_server])
WHEN NOT MATCHED BY SOURCE 
	THEN DELETE;
GO
