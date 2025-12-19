USE [<<Database>>];
GO

/* Drop all Stored Procedures (P) */
DECLARE @SchemaName NVARCHAR(128), @ProcedureName NVARCHAR(128);
DECLARE @SQLcmd NVARCHAR(MAX);

DECLARE _DropProcedure_Cursor CURSOR READ_ONLY LOCAL FAST_FORWARD FOR
SELECT SCHEMA_NAME(schema_id) AS "SchemaName", name AS "ProcedureName"
FROM sys.objects
WHERE is_ms_shipped = 0 AND type = 'P'
ORDER BY name;

OPEN _DropProcedure_Cursor;

FETCH NEXT FROM _DropProcedure_Cursor INTO @SchemaName, @ProcedureName;

WHILE @@FETCH_STATUS = 0
BEGIN
	SET @SQLcmd = 'IF OBJECT_ID(''['+@SchemaName+'].['+@ProcedureName+']'', ''P'') IS NOT NULL DROP PROCEDURE ['+@SchemaName+'].['+@ProcedureName+'];';
	EXEC sys.sp_executesql @command = @SQLcmd;
	PRINT 'Dropped Procedure: ['+RTRIM(@SchemaName)+'].['+RTRIM(@ProcedureName)+']';

	FETCH NEXT FROM _DropProcedure_Cursor INTO @SchemaName, @ProcedureName;
END;

CLOSE _DropProcedure_Cursor;
DEALLOCATE _DropProcedure_Cursor;
GO


/* Drop all Default Constraints (D) */
DECLARE @SchemaName NVARCHAR(128), @ConstraintName NVARCHAR(128), @TableName NVARCHAR(128);
DECLARE @SQLcmd NVARCHAR(MAX);

DECLARE _DropDefaultConstraint_Cursor CURSOR READ_ONLY LOCAL FAST_FORWARD FOR
SELECT SCHEMA_NAME(schema_id) AS "SchemaName", name AS "DefaultConstraintName", OBJECT_NAME(parent_object_id) AS "TableName"
FROM sys.objects
WHERE is_ms_shipped = 0 AND type = 'D' AND OBJECTPROPERTY(parent_object_id,'IsUserTable') = 1
ORDER BY name;

OPEN _DropDefaultConstraint_Cursor;

FETCH NEXT FROM _DropDefaultConstraint_Cursor INTO @SchemaName, @ConstraintName, @TableName;

WHILE @@FETCH_STATUS = 0
BEGIN
	SET @SQLcmd = 'IF OBJECT_ID(''['+@SchemaName+'].['+@ConstraintName+']'', ''D'') IS NOT NULL ALTER TABLE ['+@SchemaName+'].['+@TableName+'] DROP CONSTRAINT ['+@ConstraintName+'];';
	EXEC sys.sp_executesql @command = @SQLcmd;
	PRINT 'Dropped Default Constraint: ['+RTRIM(@ConstraintName)+'] on Table: ['+RTRIM(@SchemaName)+'].['+RTRIM(@TableName)+']';

	FETCH NEXT FROM _DropDefaultConstraint_Cursor INTO @SchemaName, @ConstraintName, @TableName;
END;

CLOSE _DropDefaultConstraint_Cursor;
DEALLOCATE _DropDefaultConstraint_Cursor;
GO


/* Drop all Check Constraints (C) */
DECLARE @SchemaName NVARCHAR(128), @ConstraintName NVARCHAR(128), @TableName NVARCHAR(128);
DECLARE @SQLcmd NVARCHAR(MAX);

DECLARE _DropCheckConstraint_Cursor CURSOR READ_ONLY LOCAL FAST_FORWARD FOR
SELECT SCHEMA_NAME(schema_id) AS "SchemaName", name AS "CheckConstraintName", OBJECT_NAME(parent_object_id) AS "TableName"
FROM sys.objects
WHERE is_ms_shipped = 0 AND type = 'C' AND OBJECTPROPERTY(parent_object_id,'IsUserTable') = 1
ORDER BY name;

OPEN _DropCheckConstraint_Cursor;

FETCH NEXT FROM _DropCheckConstraint_Cursor INTO @SchemaName, @ConstraintName, @TableName;

WHILE @@FETCH_STATUS = 0
BEGIN
	SET @SQLcmd = 'IF OBJECT_ID(''['+@SchemaName+'].['+@ConstraintName+']'', ''C'') IS NOT NULL ALTER TABLE ['+@SchemaName+'].['+@TableName+'] DROP CONSTRAINT ['+@ConstraintName+'];';
	EXEC sys.sp_executesql @command = @SQLcmd;
	PRINT 'Dropped Check Constraint: ['+RTRIM(@ConstraintName)+'] on Table: ['+RTRIM(@SchemaName)+'].['+RTRIM(@TableName)+']';

	FETCH NEXT FROM _DropCheckConstraint_Cursor INTO @SchemaName, @ConstraintName, @TableName;
END;

CLOSE _DropCheckConstraint_Cursor;
DEALLOCATE _DropCheckConstraint_Cursor;
GO


/* Drop all ForeignKey Constraints (F) */
DECLARE @SchemaName NVARCHAR(128), @ConstraintName NVARCHAR(128), @TableName NVARCHAR(128);
DECLARE @SQLcmd NVARCHAR(MAX);

DECLARE _DropForeignKeyConstraint_Cursor CURSOR READ_ONLY LOCAL FAST_FORWARD FOR
SELECT SCHEMA_NAME(schema_id) AS "SchemaName", name AS "ForeignKeyConstraintName", OBJECT_NAME(parent_object_id) AS "TableName"
FROM sys.objects
WHERE is_ms_shipped = 0 AND type = 'F' AND OBJECTPROPERTY(parent_object_id,'IsUserTable') = 1
ORDER BY name;

OPEN _DropForeignKeyConstraint_Cursor;

FETCH NEXT FROM _DropForeignKeyConstraint_Cursor INTO @SchemaName, @ConstraintName, @TableName;

WHILE @@FETCH_STATUS = 0
BEGIN
	SET @SQLcmd = 'IF OBJECT_ID(''['+@SchemaName+'].['+@ConstraintName+']'', ''F'') IS NOT NULL ALTER TABLE ['+@SchemaName+'].['+@TableName+'] DROP CONSTRAINT ['+@ConstraintName+'];';
	EXEC sys.sp_executesql @command = @SQLcmd;
	PRINT 'Dropped ForeignKey Constraint: ['+RTRIM(@ConstraintName)+'] on Table: ['+RTRIM(@SchemaName)+'].['+RTRIM(@TableName)+']';

	FETCH NEXT FROM _DropForeignKeyConstraint_Cursor INTO @SchemaName, @ConstraintName, @TableName;
END;

CLOSE _DropForeignKeyConstraint_Cursor;
DEALLOCATE _DropForeignKeyConstraint_Cursor;
GO


/* Drop all Unique Constraints (UQ) */
DECLARE @SchemaName NVARCHAR(128), @ConstraintName NVARCHAR(128), @TableName NVARCHAR(128);
DECLARE @SQLcmd NVARCHAR(MAX);

DECLARE _DropUniqueConstraint_Cursor CURSOR READ_ONLY LOCAL FAST_FORWARD FOR
SELECT SCHEMA_NAME(schema_id) AS "SchemaName", name AS "ConstraintName", OBJECT_NAME(parent_object_id) AS "TableName"
FROM sys.objects
WHERE is_ms_shipped = 0 AND type = 'UQ' AND OBJECTPROPERTY(parent_object_id,'IsUserTable') = 1
ORDER BY name;

OPEN _DropUniqueConstraint_Cursor;

FETCH NEXT FROM _DropUniqueConstraint_Cursor INTO @SchemaName, @ConstraintName, @TableName;

WHILE @@FETCH_STATUS = 0
BEGIN
	SET @SQLcmd = 'IF OBJECT_ID(''['+@SchemaName+'].['+@ConstraintName+']'', ''UQ'') IS NOT NULL ALTER TABLE ['+@SchemaName+'].['+@TableName+'] DROP CONSTRAINT ['+@ConstraintName+'];';
	EXEC sys.sp_executesql @command = @SQLcmd;
	PRINT 'Dropped Unique Constraint: ['+RTRIM(@ConstraintName)+'] on Table: ['+RTRIM(@SchemaName)+'].['+RTRIM(@TableName)+']';

	FETCH NEXT FROM _DropUniqueConstraint_Cursor INTO @SchemaName, @ConstraintName, @TableName;
END;

CLOSE _DropUniqueConstraint_Cursor;
DEALLOCATE _DropUniqueConstraint_Cursor;
GO


/* Drop all PrimaryKey Constraints (PK) */
DECLARE @SchemaName NVARCHAR(128), @ConstraintName NVARCHAR(128), @TableName NVARCHAR(128);
DECLARE @SQLcmd NVARCHAR(MAX);

DECLARE _DropPrimaryKeyConstraint_Cursor CURSOR READ_ONLY LOCAL FAST_FORWARD FOR
SELECT SCHEMA_NAME(schema_id) AS "SchemaName", name AS "PrimaryKeyConstraintName", OBJECT_NAME(parent_object_id) AS "TableName"
FROM sys.objects
WHERE is_ms_shipped = 0 AND type = 'PK' AND OBJECTPROPERTY(parent_object_id,'IsUserTable') = 1
ORDER BY name;

OPEN _DropPrimaryKeyConstraint_Cursor;

FETCH NEXT FROM _DropPrimaryKeyConstraint_Cursor INTO @SchemaName, @ConstraintName, @TableName;

WHILE @@FETCH_STATUS = 0
BEGIN
	SET @SQLcmd = 'IF OBJECT_ID(''['+@SchemaName+'].['+@ConstraintName+']'', ''PK'') IS NOT NULL ALTER TABLE ['+@SchemaName+'].['+@TableName+'] DROP CONSTRAINT ['+@ConstraintName+'];';
	EXEC sys.sp_executesql @command = @SQLcmd;
	PRINT 'Dropped PrimaryKey Constraint: ['+RTRIM(@ConstraintName)+'] on Table: ['+RTRIM(@SchemaName)+'].['+RTRIM(@TableName)+']';

	FETCH NEXT FROM _DropPrimaryKeyConstraint_Cursor INTO @SchemaName, @ConstraintName, @TableName;
END;

CLOSE _DropPrimaryKeyConstraint_Cursor;
DEALLOCATE _DropPrimaryKeyConstraint_Cursor;
GO


/* Drop all Indexes after dropping indexes for PK, FK, UQ*/
DECLARE @IndexName NVARCHAR(128), @SchemaName NVARCHAR(128), @TableName NVARCHAR(128);
DECLARE @SQLcmd NVARCHAR(MAX);

DECLARE _DropIndex_Cursor CURSOR READ_ONLY LOCAL FAST_FORWARD FOR
SELECT I.name AS "IndexName", SCHEMA_NAME(T.schema_id) AS "SchemaName", T.name AS "TableName"
FROM sys.indexes AS I
INNER JOIN sys.tables AS T ON T.object_id = I.object_id
WHERE T.is_ms_shipped = 0 AND I.type <> 0
ORDER BY I.name;

OPEN _DropIndex_Cursor;

FETCH NEXT FROM _DropIndex_Cursor INTO @IndexName, @SchemaName, @TableName;

WHILE @@FETCH_STATUS = 0
BEGIN
	SET @SQLcmd = N'IF EXISTS (SELECT name FROM sys.indexes WHERE object_id = OBJECT_ID(''['+@SchemaName+'].['+@TableName+']'', ''U'') AND name = '''+@IndexName+''') DROP INDEX ['+@IndexName+'] ON ['+@SchemaName+'].['+@TableName+'];';
	EXEC sys.sp_executesql @command = @SQLcmd;
	PRINT 'Dropped Index: ['+RTRIM(@IndexName)+'] ON ['+RTRIM(@SchemaName)+'].['+RTRIM(@TableName)+']';

	FETCH NEXT FROM _DropIndex_Cursor INTO @IndexName, @SchemaName, @TableName;
END;

CLOSE _DropIndex_Cursor;
DEALLOCATE _DropIndex_Cursor;
GO


/* Drop all Scalar Functions (FN) */
DECLARE @SchemaName NVARCHAR(128), @FunctionName NVARCHAR(128);
DECLARE @SQLcmd NVARCHAR(MAX);

DECLARE _DropScalarFunction_Cursor CURSOR READ_ONLY LOCAL FAST_FORWARD FOR
SELECT SCHEMA_NAME(schema_id) AS "SchemaName", name AS "ScalarFunctionName"
FROM sys.objects
WHERE is_ms_shipped = 0 AND type = 'FN'
ORDER BY name;

OPEN _DropScalarFunction_Cursor;

FETCH NEXT FROM _DropScalarFunction_Cursor INTO @SchemaName, @FunctionName;

WHILE @@FETCH_STATUS = 0
BEGIN
	SET @SQLcmd = 'IF OBJECT_ID(''['+@SchemaName+'].['+@FunctionName+']'', ''FN'') IS NOT NULL DROP FUNCTION ['+@SchemaName+'].['+@FunctionName+'];';
	EXEC sys.sp_executesql @command = @SQLcmd;
	PRINT 'Dropped Scalar Function: ['+RTRIM(@SchemaName)+'].['+RTRIM(@FunctionName)+']';

	FETCH NEXT FROM _DropScalarFunction_Cursor INTO @SchemaName, @FunctionName;
END;

CLOSE _DropScalarFunction_Cursor;
DEALLOCATE _DropScalarFunction_Cursor;
GO


/* Drop all Table Valued Functions (TF) */
DECLARE @SchemaName NVARCHAR(128), @FunctionName NVARCHAR(128);
DECLARE @SQLcmd NVARCHAR(MAX);

DECLARE _DropTableValuedFunction_Cursor CURSOR READ_ONLY LOCAL FAST_FORWARD FOR
SELECT SCHEMA_NAME(schema_id) AS "SchemaName", name AS "TableValuedFunctionName"
FROM sys.objects
WHERE is_ms_shipped = 0 AND type = 'TF'
ORDER BY name;

OPEN _DropTableValuedFunction_Cursor;

FETCH NEXT FROM _DropTableValuedFunction_Cursor INTO @SchemaName, @FunctionName;

WHILE @@FETCH_STATUS = 0
BEGIN
	SET @SQLcmd = 'IF OBJECT_ID(''['+@SchemaName+'].['+@FunctionName+']'', ''TF'') IS NOT NULL DROP FUNCTION ['+@SchemaName+'].['+@FunctionName+'];';
	EXEC sys.sp_executesql @command = @SQLcmd;
	PRINT 'Dropped Table Valued Function: ['+RTRIM(@SchemaName)+'].['+RTRIM(@FunctionName)+']';

	FETCH NEXT FROM _DropTableValuedFunction_Cursor INTO @SchemaName, @FunctionName;
END;

CLOSE _DropTableValuedFunction_Cursor;
DEALLOCATE _DropTableValuedFunction_Cursor;
GO


/* Drop all Inline Table Valued Functions (IF) */
DECLARE @SchemaName NVARCHAR(128), @FunctionName NVARCHAR(128);
DECLARE @SQLcmd NVARCHAR(MAX);

DECLARE _DropInlineTableValuedFunction_Cursor CURSOR READ_ONLY LOCAL FAST_FORWARD FOR
SELECT SCHEMA_NAME(schema_id) AS "SchemaName", name AS "InlineTableValuedFunctionName"
FROM sys.objects
WHERE is_ms_shipped = 0 AND type = 'IF'
ORDER BY name;

OPEN _DropInlineTableValuedFunction_Cursor;

FETCH NEXT FROM _DropInlineTableValuedFunction_Cursor INTO @SchemaName, @FunctionName;

WHILE @@FETCH_STATUS = 0
BEGIN
	SET @SQLcmd = 'IF OBJECT_ID(''['+@SchemaName+'].['+@FunctionName+']'', ''IF'') IS NOT NULL DROP FUNCTION ['+@SchemaName+'].['+@FunctionName+'];';
	EXEC sys.sp_executesql @command = @SQLcmd;
	PRINT 'Dropped Inline Table Valued Function: ['+RTRIM(@SchemaName)+'].['+RTRIM(@FunctionName)+']';

	FETCH NEXT FROM _DropInlineTableValuedFunction_Cursor INTO @SchemaName, @FunctionName;
END;

CLOSE _DropInlineTableValuedFunction_Cursor;
DEALLOCATE _DropInlineTableValuedFunction_Cursor;
GO


/* Drop all Assembly (CLR) Table Valued Function (FT) */
DECLARE @SchemaName NVARCHAR(128), @FunctionName NVARCHAR(128);
DECLARE @SQLcmd NVARCHAR(MAX);

DECLARE _DropAssemblyTableValuedFunction_Cursor CURSOR READ_ONLY LOCAL FAST_FORWARD FOR
SELECT SCHEMA_NAME(schema_id) AS "SchemaName", name AS "FunctionName"
FROM sys.objects
WHERE is_ms_shipped = 0 AND type = 'FT'
ORDER BY name;

OPEN _DropAssemblyTableValuedFunction_Cursor;

FETCH NEXT FROM _DropAssemblyTableValuedFunction_Cursor INTO @SchemaName, @FunctionName;

WHILE @@FETCH_STATUS = 0
BEGIN
	SET @SQLcmd = 'IF OBJECT_ID(''['+@SchemaName+'].['+@FunctionName+']'', ''FT'') IS NOT NULL DROP FUNCTION ['+@SchemaName+'].['+@FunctionName+'];';
	EXEC sys.sp_executesql @command = @SQLcmd;
	PRINT 'Dropped Assembly (CLR) Table Valued Function: ['+RTRIM(@SchemaName)+'].['+RTRIM(@FunctionName)+']';

	FETCH NEXT FROM _DropAssemblyTableValuedFunction_Cursor INTO @SchemaName, @FunctionName;
END;

CLOSE _DropAssemblyTableValuedFunction_Cursor;
DEALLOCATE _DropAssemblyTableValuedFunction_Cursor;
GO


/* Drop all Views (V) */
DECLARE @SchemaName NVARCHAR(128), @ViewName NVARCHAR(128);
DECLARE @SQLcmd NVARCHAR(MAX);

DECLARE _DropView_Cursor CURSOR READ_ONLY LOCAL FAST_FORWARD FOR
SELECT SCHEMA_NAME(schema_id) AS "SchemaName", name AS "ViewName"
FROM sys.objects
WHERE is_ms_shipped = 0 AND type = 'V'
ORDER BY name;

OPEN _DropView_Cursor;

FETCH NEXT FROM _DropView_Cursor INTO @SchemaName, @ViewName;

WHILE @@FETCH_STATUS = 0
BEGIN
	SET @SQLcmd = 'IF OBJECT_ID(''['+@SchemaName+'].['+@ViewName+']'', ''V'') IS NOT NULL DROP VIEW ['+@SchemaName+'].['+@ViewName+'];';
	EXEC sys.sp_executesql @command = @SQLcmd;
	PRINT 'Dropped View: ['+RTRIM(@SchemaName)+'].['+RTRIM(@ViewName)+']';

	FETCH NEXT FROM _DropView_Cursor INTO @SchemaName, @ViewName;
END;

CLOSE _DropView_Cursor;
DEALLOCATE _DropView_Cursor;
GO


/* Drop all Tables (U) */
DECLARE @SchemaName NVARCHAR(128), @TableName NVARCHAR(128);
DECLARE @SQLcmd NVARCHAR(MAX);

DECLARE _DropTable_Cursor CURSOR READ_ONLY LOCAL FAST_FORWARD FOR
SELECT SCHEMA_NAME(schema_id) AS "SchemaName", name AS "TableName"
FROM sys.objects
WHERE is_ms_shipped = 0 AND type = 'U'
ORDER BY name;

OPEN _DropTable_Cursor;

FETCH NEXT FROM _DropTable_Cursor INTO @SchemaName, @TableName;

WHILE @@FETCH_STATUS = 0
BEGIN
	SET @SQLcmd = 'IF OBJECT_ID(''['+@SchemaName+'].['+@TableName+']'', ''U'') IS NOT NULL DROP TABLE ['+@SchemaName+'].['+@TableName+'];';
	EXEC sys.sp_executesql @command = @SQLcmd;
	PRINT 'Dropped Table: ['+RTRIM(@SchemaName)+'].['+RTRIM(@TableName)+']';

	FETCH NEXT FROM _DropTable_Cursor INTO @SchemaName, @TableName;
END;

CLOSE _DropTable_Cursor;
DEALLOCATE _DropTable_Cursor;
GO


/* Drop all Rules (R) */
DECLARE @SchemaName NVARCHAR(128), @RuleName NVARCHAR(128);
DECLARE @SQLcmd NVARCHAR(MAX);

DECLARE _DropRule_Cursor CURSOR READ_ONLY LOCAL FAST_FORWARD FOR
SELECT SCHEMA_NAME(schema_id) AS "SchemaName", name AS "RuleName"
FROM sys.objects
WHERE is_ms_shipped = 0 AND type = 'R'
ORDER BY name;

OPEN _DropRule_Cursor;

FETCH NEXT FROM _DropRule_Cursor INTO @SchemaName, @RuleName;

WHILE @@FETCH_STATUS = 0
BEGIN
	SET @SQLcmd = 'IF OBJECT_ID(''['+@SchemaName+'].['+@RuleName+']'', ''R'') IS NOT NULL DROP RULE ['+@SchemaName+'].['+@RuleName+'];';
	EXEC sys.sp_executesql @command = @SQLcmd;
	PRINT 'Dropped Rule: ['+RTRIM(@SchemaName)+'].['+RTRIM(@RuleName)+']';

	FETCH NEXT FROM _DropRule_Cursor INTO @SchemaName, @RuleName;
END;

CLOSE _DropRule_Cursor;
DEALLOCATE _DropRule_Cursor;
GO


/* Drop all Synonyms (SN) */
DECLARE @SchemaName NVARCHAR(128), @SynonymName NVARCHAR(128);
DECLARE @SQLcmd NVARCHAR(MAX);

DECLARE _DropSynonym_Cursor CURSOR READ_ONLY LOCAL FAST_FORWARD FOR
SELECT SCHEMA_NAME(schema_id) AS "SchemaName", name AS "SynonymName"
FROM sys.objects
WHERE is_ms_shipped = 0 AND type = 'SN'
ORDER BY name;

OPEN _DropSynonym_Cursor;

FETCH NEXT FROM _DropSynonym_Cursor INTO @SchemaName, @SynonymName;

WHILE @@FETCH_STATUS = 0
BEGIN
	SET @SQLcmd = 'IF OBJECT_ID(''['+@SchemaName+'].['+@SynonymName+']'', ''SN'') IS NOT NULL DROP SYNONYM ['+@SchemaName+'].['+@SynonymName+'];';
	EXEC sys.sp_executesql @command = @SQLcmd;
	PRINT 'Dropped Synonym: ['+RTRIM(@SchemaName)+'].['+RTRIM(@SynonymName)+']';

	FETCH NEXT FROM _DropSynonym_Cursor INTO @SchemaName, @SynonymName;
END;

CLOSE _DropSynonym_Cursor;
DEALLOCATE _DropSynonym_Cursor;
GO


/* Drop all User Defined DataTypes */
DECLARE @SchemaName NVARCHAR(128), @DataTypeName NVARCHAR(128);
DECLARE @SQLcmd NVARCHAR(MAX);

DECLARE _DropUserDefinedDataType_Cursor CURSOR READ_ONLY LOCAL FAST_FORWARD FOR
SELECT SCHEMA_NAME(schema_id) AS "SchemaName", name AS "DataTypeName"
FROM sys.types
WHERE is_user_defined = 1 AND is_table_type = 0
ORDER BY name;

OPEN _DropUserDefinedDataType_Cursor;

FETCH NEXT FROM _DropUserDefinedDataType_Cursor INTO @SchemaName, @DataTypeName;

WHILE @@FETCH_STATUS = 0
BEGIN
	SET @SQLcmd = 'IF EXISTS (SELECT * FROM sys.types WHERE is_user_defined = 1 AND is_table_type = 0 AND SCHEMA_NAME(schema_id) = '''+@SchemaName+''' AND name = '''+@DataTypeName+''') DROP TYPE ['+@SchemaName+'].['+@DataTypeName+'];';
	EXEC sys.sp_executesql @command = @SQLcmd;
	PRINT 'Dropped User Defined DataType: ['+RTRIM(@SchemaName)+'].['+RTRIM(@DataTypeName)+']';

	FETCH NEXT FROM _DropUserDefinedDataType_Cursor INTO @SchemaName, @DataTypeName;
END;

CLOSE _DropUserDefinedDataType_Cursor;
DEALLOCATE _DropUserDefinedDataType_Cursor;
GO


/* Drop all User Defined TableTypes */
DECLARE @SchemaName NVARCHAR(128), @TableTypeName NVARCHAR(128);
DECLARE @SQLcmd NVARCHAR(MAX);

DECLARE _DropUserDefinedTableType_Cursor CURSOR READ_ONLY LOCAL FAST_FORWARD FOR
SELECT SCHEMA_NAME(schema_id) AS "SchemaName", name AS "TableTypeName"
FROM sys.types
WHERE is_user_defined = 1 AND is_table_type = 1
ORDER BY name;

OPEN _DropUserDefinedTableType_Cursor;

FETCH NEXT FROM _DropUserDefinedTableType_Cursor INTO @SchemaName, @TableTypeName;

WHILE @@FETCH_STATUS = 0
BEGIN
	SET @SQLcmd = 'IF EXISTS (SELECT * FROM sys.types WHERE is_user_defined = 1 AND is_table_type = 1 AND SCHEMA_NAME(schema_id) = '''+@SchemaName+''' AND name = '''+@TableTypeName+''') DROP TYPE ['+@SchemaName+'].['+@TableTypeName+'];';
	EXEC sys.sp_executesql @command = @SQLcmd;
	PRINT 'Dropped User Defined TableType: ['+RTRIM(@SchemaName)+'].['+RTRIM(@TableTypeName)+']';

	FETCH NEXT FROM _DropUserDefinedTableType_Cursor INTO @SchemaName, @TableTypeName;
END;

CLOSE _DropUserDefinedTableType_Cursor;
DEALLOCATE _DropUserDefinedTableType_Cursor;
GO


/* Drop all Users */
DECLARE @UserName NVARCHAR(128);
DECLARE @SQLcmd NVARCHAR(MAX);

DECLARE _DropUser_Cursor CURSOR READ_ONLY LOCAL FAST_FORWARD FOR
SELECT name
FROM sys.sysusers
WHERE DB_ID() NOT IN (1,2,3,4) AND uid > 4 AND islogin = 1;

OPEN _DropUser_Cursor;

FETCH NEXT FROM _DropUser_Cursor INTO @UserName;

WHILE @@FETCH_STATUS = 0
BEGIN
	SET @SQLcmd = 'IF EXISTS (SELECT * FROM sys.sysusers WHERE uid > 4 AND islogin = 1 AND name = '''+@UserName+''')'+CHAR(10)
				+ 'BEGIN'+CHAR(10)
				+ '	ALTER USER ['+@UserName+'] WITH DEFAULT_SCHEMA=[dbo];'+CHAR(10)
				+ '	ALTER AUTHORIZATION ON SCHEMA::['+@UserName+'] TO [dbo];'+CHAR(10)
				+ '	DROP USER ['+@UserName+'];'+CHAR(10)
				+ 'END;';
	EXEC sys.sp_executesql @command = @SQLcmd;
	PRINT 'Dropped User: ['+RTRIM(@UserName)+']';

	FETCH NEXT FROM _DropUser_Cursor INTO @UserName;
END;

CLOSE _DropUser_Cursor;
DEALLOCATE _DropUser_Cursor;
GO


/* Drop all User Defined Schemas */
DECLARE @SchemaName NVARCHAR(128);
DECLARE @SQLcmd NVARCHAR(MAX);

DECLARE _DropSchema_Cursor CURSOR READ_ONLY LOCAL FAST_FORWARD FOR
SELECT name
FROM sys.schemas
WHERE schema_id <> principal_id
ORDER BY name;

OPEN _DropSchema_Cursor;

FETCH NEXT FROM _DropSchema_Cursor INTO @SchemaName;

WHILE @@FETCH_STATUS = 0
BEGIN
	SET @SQLcmd = 'IF EXISTS (SELECT * FROM sys.schemas WHERE name = '''+@SchemaName+''') DROP SCHEMA ['+@SchemaName+'];';
	EXEC sys.sp_executesql @command = @SQLcmd;
	PRINT 'Dropped Schema: ['+RTRIM(@SchemaName)+']';

	FETCH NEXT FROM _DropSchema_Cursor INTO @SchemaName;
END;

CLOSE _DropSchema_Cursor;
DEALLOCATE _DropSchema_Cursor;
GO