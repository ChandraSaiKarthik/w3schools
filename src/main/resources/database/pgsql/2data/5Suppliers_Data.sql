MERGE INTO "public"."Suppliers" AS T
USING (
		VALUES
			 (1,'Exotic Liquid','Charlotte Cooper','49 Gilbert St.','London','EC1 4SD','UK')
			,(2,'New Orleans Cajun Delights','Shelley Burke','P.O. Box 78934','New Orleans','70117','USA')
			,(3,'Grandma Kellys Homestead','Regina Murphy','707 Oxford Rd.','Ann Arbor','48104','USA')
			,(4,'Tokyo Traders','Yoshi Nagase','9-8 Sekimai Musashino-shi','Tokyo','100','Japan')
			,(5,'Cooperativa de Quesos Las Cabras','Antonio del Valle Saavedra','Calle del Rosal 4','Oviedo','33007','Spain')
			,(6,'Mayumis','Mayumi Ohno','92 Setsuko Chuo-ku','Osaka','545','Japan')
			,(7,'Pavlova, Ltd.','Ian Devling','74 Rose St. Moonie Ponds','Melbourne','3058','Australia')
			,(8,'Specialty Biscuits, Ltd.','Peter Wilson','29 Kings Way','Manchester','M14 GSD','UK')
			,(9,'PB Knäckebröd AB','Lars Peterson','Kaloadagatan 13','Goteborg','S-345 67','Sweden')
			,(10,'Refrescos Americanas LTDA','Carlos Diaz','Av. das Americanas 12.890','Sao Paulo','5442','Brazil')
			,(11,'Heli Süßwaren GmbH & Co. KG','Petra Winkler','Tiergartenstraße 5','Berlin','10785','Germany')
			,(12,'Plutzer Lebensmittelgroßmärkte AG','Martin Bein','Bogenallee 51','Frankfurt','60439','Germany')
			,(13,'Nord-Ost-Fisch Handelsgesellschaft mbH','Sven Petersen','Frahmredder 112a','Cuxhaven','27478','Germany')
			,(14,'Formaggi Fortini s.r.l.','Elio Rossi','Viale Dante, 75','Ravenna','48100','Italy')
			,(15,'Norske Meierier','Beate Vileid','Hatlevegen 5','Sandvika','1320','Norway')
			,(16,'Bigfoot Breweries','Cheryl Saylor','3400 - 8th Avenue Suite 210','Bend','97101','USA')
			,(17,'Svensk Sjöföda AB','Michael Björn','Brovallavägen 231','Stockholm','S-123 45','Sweden')
			,(18,'Aux joyeux ecclésiastiques','Guylène Nodier','203, Rue des Francs-Bourgeois','Paris','75004','France')
			,(19,'New England Seafood Cannery','Robb Merchant','Order Processing Dept. 2100 Paul Revere Blvd.','Boston','02134','USA')
			,(20,'Leka Trading','Chandra Leka','471 Serangoon Loop, Suite #402','Singapore','0512','Singapore')
			,(21,'Lyngbysild','Niels Petersen','Lyngbysild Fiskebakken 10','Lyngby','2800','Denmark')
			,(22,'Zaanse Snoepfabriek','Dirk Luchte','Verkoop Rijnweg 22','Zaandam','9999 ZZ','Netherlands')
			,(23,'Karkki Oy','Anne Heikkonen','Valtakatu 12','Lappeenranta','53120','Finland')
			,(24,'Gday, Mate','Wendy Mackenzie','170 Prince Edward Parade Hunters Hill','Sydney','2042','Australia')
			,(25,'Ma Maison','Jean-Guy Lauzon','2960 Rue St. Laurent','Montreal','H1J 1C3','Canada')
			,(26,'Pasta Buttini s.r.l.','Giovanni Giudici','Via dei Gelsomini, 153','Salerno','84100','Italy')
			,(27,'Escargots Nouveaux','Marie Delamare','22, rue H. Voiron','Montceau','71300','France')
			,(28,'Gai pâturage','Eliane Noz','Bat. B 3, rue des Alpes','Annecy','74000','France')
			,(29,'Forêts dérables','Chantal Goulet','148 rue Chasseur','Ste-Hyacinthe','J2S 7S8','Canada')
	  ) AS S ("SupplierID", "SupplierName", "ContactName", "Address", "City", "PostalCode", "Country")
	ON T."SupplierID" = S."SupplierID"
WHEN MATCHED AND (T."SupplierName" IS DISTINCT FROM S."SupplierName") OR (T."ContactName" IS DISTINCT FROM S."ContactName") OR (T."Address" IS DISTINCT FROM S."Address") OR (T."City" IS DISTINCT FROM S."City") OR (T."PostalCode" IS DISTINCT FROM S."PostalCode") OR (T."Country" IS DISTINCT FROM S."Country")
	THEN UPDATE SET "SupplierName" = S."SupplierName", "ContactName" = S."ContactName", "Address" = S."Address", "City" = S."City", "PostalCode" = S."PostalCode", "Country" = S."Country"
WHEN NOT MATCHED
	THEN INSERT ("SupplierID", "SupplierName", "ContactName", "Address", "City", "PostalCode", "Country")
		 OVERRIDING SYSTEM VALUE
		 VALUES (S."SupplierID", S."SupplierName", S."ContactName", S."Address", S."City", S."PostalCode", S."Country")
;
SELECT setval('"public"."suppliers_supplierid_seq"', (SELECT MAX("SupplierID") FROM "public"."Suppliers"));
