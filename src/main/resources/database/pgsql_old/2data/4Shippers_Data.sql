MERGE INTO "public"."Shippers" AS T
USING (
		VALUES
			 (1,'Speedy Express','(503) 555-9831')
			,(2,'United Package','(503) 555-3199')
			,(3,'Federal Shipping','(503) 555-9931')
	  ) AS S ("ShipperID", "ShipperName", "Phone")
	ON T."ShipperID" = S."ShipperID"
WHEN MATCHED AND (T."ShipperName" IS DISTINCT FROM S."ShipperName") OR (T."Phone" IS DISTINCT FROM S."Phone")
	THEN UPDATE SET "ShipperName" = S."ShipperName", "Phone" = S."Phone"
WHEN NOT MATCHED
	THEN INSERT ("ShipperID", "ShipperName", "Phone")
		 OVERRIDING SYSTEM VALUE
		 VALUES (S."ShipperID", S."ShipperName", S."Phone")
;
SELECT setval('"public"."shippers_shipperid_seq"', (SELECT MAX("ShipperID") FROM "public"."Shippers"));
