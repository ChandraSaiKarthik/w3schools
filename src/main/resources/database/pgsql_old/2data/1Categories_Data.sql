MERGE INTO "public"."Categories" AS T
USING (
		VALUES
			 (1,'Beverages','Soft drinks, coffees, teas, beers and ales')
			,(2,'Condiments','Sweet and savory sauces, relishes, spreads and seasonings')
			,(3,'Confections','Desserts, candies and sweet breads')
			,(4,'Dairy Products','Cheeses')
			,(5,'Grains/Cereals','Breads, crackers, pasta and cereal')
			,(6,'Meat/Poultry','Prepared meats')
			,(7,'Produce','Dried fruit and bean curd')
			,(8,'Seafood','Seaweed and fish')
	  ) AS S ("CategoryID", "CategoryName", "Description")
	ON T."CategoryID" = S."CategoryID"
WHEN MATCHED AND (T."CategoryName" IS DISTINCT FROM S."CategoryName") OR (T."Description" IS DISTINCT FROM S."Description")
	THEN UPDATE SET "CategoryName" = S."CategoryName", "Description" = S."Description"
WHEN NOT MATCHED
	THEN INSERT ("CategoryID", "CategoryName", "Description")
		 OVERRIDING SYSTEM VALUE
		 VALUES (S."CategoryID", S."CategoryName", S."Description")
;
SELECT setval('"public"."categories_categoryid_seq"', (SELECT MAX("CategoryID") FROM "public"."Categories"));
