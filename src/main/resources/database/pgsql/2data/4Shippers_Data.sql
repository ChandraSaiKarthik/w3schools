MERGE INTO Shippers AS T
USING (
		VALUES
			('Speedy Express', '(503) 555-9831', 1),
			('United Package', '(503) 555-3199', 2),
			('Federal Shipping', '(503) 555-9931', 3)
) AS S (ShipperName, Phone, ShipperID)
ON T.ShipperID = S.ShipperID
WHEN MATCHED AND (T.ShipperName IS DISTINCT FROM S.ShipperName OR 
                  T.Phone IS DISTINCT FROM S.Phone)
    THEN UPDATE 
        SET ShipperName = S.ShipperName,
            Phone = S.Phone
WHEN NOT MATCHED 
    THEN INSERT (ShipperName, Phone, ShipperID)
         VALUES (S.ShipperName, S.Phone, S.ShipperID);