USE [<<Database>>];
GO


INSERT INTO log.Actions ([EntityType], [EntityID], [ActionDescription], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsActive], [IsPassive], [Remarks])
VALUES 
	('Customer', 1, 'Customer created', GETDATE(), SUSER_NAME(), GETDATE(), SUSER_NAME(), 1, 0, 'Initial creation'),
	('Supplier', 2, 'Supplier updated', GETDATE(), SUSER_NAME(), GETDATE(), SUSER_NAME(), 1, 0, 'Updated contact information');
GO


MERGE INTO log.DataTypes AS T
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


INSERT INTO log.SpecialDataTypes (HierarchyID, Geometry, Geography)
VALUES 
	(HIERARCHYID::Parse('/1/'), GEOMETRY::STGeomFromText('POINT(1 1)', 0), GEOGRAPHY::STGeomFromText('POINT(1 1)', 4326)),
	(HIERARCHYID::Parse('/2/'), GEOMETRY::STGeomFromText('LINESTRING(0 0, 1 1)', 0), GEOGRAPHY::STGeomFromText('LINESTRING(0 0, 1 1)', 4326)),
	(HIERARCHYID::Parse('/3/'), GEOMETRY::STGeomFromText('POLYGON((0 0, 1 1, 1 0, 0 0))', 0), GEOGRAPHY::STGeomFromText('POLYGON((0 0, 1 1, 1 0, 0 0))', 4326));
GO