USE [<<Database>>];
GO

SET IDENTITY_INSERT [dbo].[Suppliers] ON;
MERGE INTO [dbo].[Suppliers] AS T
USING (
		VALUES
			 ('Exotic Liquid','Charlotte Cooper','49 Gilbert St.','London','EC1 4SD','UK',1)
			,('New Orleans Cajun Delights','Shelley Burke','P.O. Box 78934','New Orleans','70117','USA',2)
			,('Grandma Kellys Homestead','Regina Murphy','707 Oxford Rd.','Ann Arbor','48104','USA',3)
			,('Tokyo Traders','Yoshi Nagase','9-8 Sekimai Musashino-shi','Tokyo','100','Japan',4)
			,('Cooperativa de Quesos Las Cabras','Antonio del Valle Saavedra','Calle del Rosal 4','Oviedo','33007','Spain',5)
			,('Mayumis','Mayumi Ohno','92 Setsuko Chuo-ku','Osaka','545','Japan',6)
			,('Pavlova, Ltd.','Ian Devling','74 Rose St. Moonie Ponds','Melbourne','3058','Australia',7)
			,('Specialty Biscuits, Ltd.','Peter Wilson','29 Kings Way','Manchester','M14 GSD','UK',8)
			,('PB Knäckebröd AB','Lars Peterson','Kaloadagatan 13','Goteborg','S-345 67','Sweden',9)
			,('Refrescos Americanas LTDA','Carlos Diaz','Av. das Americanas 12.890','Sao Paulo','5442','Brazil',10)
			,('Heli Süßwaren GmbH &amp; Co. KG','Petra Winkler','Tiergartenstraße 5','Berlin','10785','Germany',11)
			,('Plutzer Lebensmittelgroßmärkte AG','Martin Bein','Bogenallee 51','Frankfurt','60439','Germany',12)
			,('Nord-Ost-Fisch Handelsgesellschaft mbH','Sven Petersen','Frahmredder 112a','Cuxhaven','27478','Germany',13)
			,('Formaggi Fortini s.r.l.','Elio Rossi','Viale Dante, 75','Ravenna','48100','Italy',14)
			,('Norske Meierier','Beate Vileid','Hatlevegen 5','Sandvika','1320','Norway',15)
			,('Bigfoot Breweries','Cheryl Saylor','3400 - 8th Avenue Suite 210','Bend','97101','USA',16)
			,('Svensk Sjöföda AB','Michael Björn','Brovallavägen 231','Stockholm','S-123 45','Sweden',17)
			,('Aux joyeux ecclésiastiques','Guylène Nodier','203, Rue des Francs-Bourgeois','Paris','75004','France',18)
			,('New England Seafood Cannery','Robb Merchant','Order Processing Dept. 2100 Paul Revere Blvd.','Boston','02134','USA',19)
			,('Leka Trading','Chandra Leka','471 Serangoon Loop, Suite #402','Singapore','0512','Singapore',20)
			,('Lyngbysild','Niels Petersen','Lyngbysild Fiskebakken 10','Lyngby','2800','Denmark',21)
			,('Zaanse Snoepfabriek','Dirk Luchte','Verkoop Rijnweg 22','Zaandam','9999 ZZ','Netherlands',22)
			,('Karkki Oy','Anne Heikkonen','Valtakatu 12','Lappeenranta','53120','Finland',23)
			,('Gday, Mate','Wendy Mackenzie','170 Prince Edward Parade Hunters Hill','Sydney','2042','Australia',24)
			,('Ma Maison','Jean-Guy Lauzon','2960 Rue St. Laurent','Montreal','H1J 1C3','Canada',25)
			,('Pasta Buttini s.r.l.','Giovanni Giudici','Via dei Gelsomini, 153','Salerno','84100','Italy',26)
			,('Escargots Nouveaux','Marie Delamare','22, rue H. Voiron','Montceau','71300','France',27)
			,('Gai pâturage','Eliane Noz','Bat. B 3, rue des Alpes','Annecy','74000','France',28)
			,('Forêts dérables','Chantal Goulet','148 rue Chasseur','Ste-Hyacinthe','J2S 7S8','Canada',29)
	  ) AS S ([SupplierName], [ContactName], [Address], [City], [PostalCode], [Country], [SupplierID])
	ON T.[SupplierID] = S.[SupplierID]
WHEN MATCHED AND ISNULL(T.[SupplierName], '') != ISNULL(S.[SupplierName], '') OR ISNULL(T.[ContactName], '') != ISNULL(S.[ContactName], '') OR ISNULL(T.[Address], '') != ISNULL(S.[Address], '') OR ISNULL(T.[City], '') != ISNULL(S.[City], '') OR ISNULL(T.[PostalCode], '') != ISNULL(S.[PostalCode], '') OR ISNULL(T.[Country], '') != ISNULL(S.[Country], '')
	THEN UPDATE SET T.[SupplierName] = S.[SupplierName], T.[ContactName] = S.[ContactName], T.[Address] = S.[Address], T.[City] = S.[City], T.[PostalCode] = S.[PostalCode], T.[Country] = S.[Country]
WHEN NOT MATCHED BY TARGET 
	THEN INSERT ([SupplierName], [ContactName], [Address], [City], [PostalCode], [Country], [SupplierID])
		 VALUES (S.[SupplierName], S.[ContactName], S.[Address], S.[City], S.[PostalCode], S.[Country], S.[SupplierID])
WHEN NOT MATCHED BY SOURCE 
	THEN DELETE
;
SET IDENTITY_INSERT [dbo].[Suppliers] OFF;
GO
