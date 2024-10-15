USE [<<Database>>];
GO

SET IDENTITY_INSERT [dbo].[Shippers] ON;
MERGE INTO [dbo].[Shippers] AS T
USING (
		VALUES
			 ('Speedy Express','(503) 555-9831',1)
			,('United Package','(503) 555-3199',2)
			,('Federal Shipping','(503) 555-9931',3)
	  ) AS S ([ShipperName], [Phone], [ShipperID])
	ON T.[ShipperID] = S.[ShipperID]
WHEN MATCHED AND ISNULL(T.[ShipperName], '') != ISNULL(S.[ShipperName], '') OR ISNULL(T.[Phone], '') != ISNULL(S.[Phone], '')
	THEN UPDATE SET T.[ShipperName] = S.[ShipperName], T.[Phone] = S.[Phone]
WHEN NOT MATCHED BY TARGET 
	THEN INSERT ([ShipperName], [Phone], [ShipperID])
		 VALUES (S.[ShipperName], S.[Phone], S.[ShipperID])
WHEN NOT MATCHED BY SOURCE 
	THEN DELETE
;
SET IDENTITY_INSERT [dbo].[Shippers] OFF;
GO
