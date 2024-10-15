USE [<<Database>>];
GO

SET IDENTITY_INSERT [dbo].[Categories] ON;
MERGE INTO [dbo].[Categories] AS T
USING (
		VALUES
			 ('Beverages','Soft drinks, coffees, teas, beers and ales',1)
			,('Condiments','Sweet and savory sauces, relishes, spreads and seasonings',2)
			,('Confections','Desserts, candies and sweet breads',3)
			,('Dairy Products','Cheeses',4)
			,('Grains/Cereals','Breads, crackers, pasta and cereal',5)
			,('Meat/Poultry','Prepared meats',6)
			,('Produce','Dried fruit and bean curd',7)
			,('Seafood','Seaweed and fish',8)
	  ) AS S ([CategoryName], [Description], [CategoryID])
	ON T.[CategoryID] = S.[CategoryID]
WHEN MATCHED AND ISNULL(T.[CategoryName], '') != ISNULL(S.[CategoryName], '') OR ISNULL(T.[Description], '') != ISNULL(S.[Description], '')
	THEN UPDATE SET T.[CategoryName] = S.[CategoryName], T.[Description] = S.[Description]
WHEN NOT MATCHED BY TARGET 
	THEN INSERT ([CategoryName], [Description], [CategoryID])
		 VALUES (S.[CategoryName], S.[Description], S.[CategoryID])
WHEN NOT MATCHED BY SOURCE 
	THEN DELETE
;
SET IDENTITY_INSERT [dbo].[Categories] OFF;
GO
