USE [<<Database>>];
GO

SET IDENTITY_INSERT [dbo].[Orders] ON;
MERGE INTO [dbo].[Orders] AS T
USING (
		VALUES
			 (90,5,'1996-07-04',3,10248)
			,(81,6,'1996-07-05',1,10249)
			,(34,4,'1996-07-08',2,10250)
			,(84,3,'1996-07-08',1,10251)
			,(76,4,'1996-07-09',2,10252)
			,(34,3,'1996-07-10',2,10253)
			,(14,5,'1996-07-11',2,10254)
			,(68,9,'1996-07-12',3,10255)
			,(88,3,'1996-07-15',2,10256)
			,(35,4,'1996-07-16',3,10257)
			,(20,1,'1996-07-17',1,10258)
			,(13,4,'1996-07-18',3,10259)
			,(55,4,'1996-07-19',1,10260)
			,(61,4,'1996-07-19',2,10261)
			,(65,8,'1996-07-22',3,10262)
			,(20,9,'1996-07-23',3,10263)
			,(24,6,'1996-07-24',3,10264)
			,(7,2,'1996-07-25',1,10265)
			,(87,3,'1996-07-26',3,10266)
			,(25,4,'1996-07-29',1,10267)
			,(33,8,'1996-07-30',3,10268)
			,(89,5,'1996-07-31',1,10269)
			,(87,1,'1996-08-01',1,10270)
			,(75,6,'1996-08-01',2,10271)
			,(65,6,'1996-08-02',2,10272)
			,(63,3,'1996-08-05',3,10273)
			,(85,6,'1996-08-06',1,10274)
			,(49,1,'1996-08-07',1,10275)
			,(80,8,'1996-08-08',3,10276)
			,(52,2,'1996-08-09',3,10277)
			,(5,8,'1996-08-12',2,10278)
			,(44,8,'1996-08-13',2,10279)
			,(5,2,'1996-08-14',1,10280)
			,(69,4,'1996-08-14',1,10281)
			,(69,4,'1996-08-15',1,10282)
			,(46,3,'1996-08-16',3,10283)
			,(44,4,'1996-08-19',1,10284)
			,(63,1,'1996-08-20',2,10285)
			,(63,8,'1996-08-21',3,10286)
			,(67,8,'1996-08-22',3,10287)
			,(66,4,'1996-08-23',1,10288)
			,(11,7,'1996-08-26',3,10289)
			,(15,8,'1996-08-27',1,10290)
			,(61,6,'1996-08-27',2,10291)
			,(81,1,'1996-08-28',2,10292)
			,(80,1,'1996-08-29',3,10293)
			,(65,4,'1996-08-30',2,10294)
			,(85,2,'1996-09-02',2,10295)
			,(46,6,'1996-09-03',1,10296)
			,(7,5,'1996-09-04',2,10297)
			,(37,6,'1996-09-05',2,10298)
			,(67,4,'1996-09-06',2,10299)
			,(49,2,'1996-09-09',2,10300)
			,(86,8,'1996-09-09',2,10301)
			,(76,4,'1996-09-10',2,10302)
			,(30,7,'1996-09-11',2,10303)
			,(80,1,'1996-09-12',2,10304)
			,(55,8,'1996-09-13',3,10305)
			,(69,1,'1996-09-16',3,10306)
			,(48,2,'1996-09-17',2,10307)
			,(2,7,'1996-09-18',3,10308)
			,(37,3,'1996-09-19',1,10309)
			,(77,8,'1996-09-20',2,10310)
			,(18,1,'1996-09-20',3,10311)
			,(86,2,'1996-09-23',2,10312)
			,(63,2,'1996-09-24',2,10313)
			,(65,1,'1996-09-25',2,10314)
			,(38,4,'1996-09-26',2,10315)
			,(65,1,'1996-09-27',3,10316)
			,(48,6,'1996-09-30',1,10317)
			,(38,8,'1996-10-01',2,10318)
			,(80,7,'1996-10-02',3,10319)
			,(87,5,'1996-10-03',3,10320)
			,(38,3,'1996-10-03',2,10321)
			,(58,7,'1996-10-04',3,10322)
			,(39,4,'1996-10-07',1,10323)
			,(71,9,'1996-10-08',1,10324)
			,(39,1,'1996-10-09',3,10325)
			,(8,4,'1996-10-10',2,10326)
			,(24,2,'1996-10-11',1,10327)
			,(28,4,'1996-10-14',3,10328)
			,(75,4,'1996-10-15',2,10329)
			,(46,3,'1996-10-16',1,10330)
			,(9,9,'1996-10-16',1,10331)
			,(51,3,'1996-10-17',2,10332)
			,(87,5,'1996-10-18',3,10333)
			,(84,8,'1996-10-21',2,10334)
			,(37,7,'1996-10-22',2,10335)
			,(60,7,'1996-10-23',2,10336)
			,(25,4,'1996-10-24',3,10337)
			,(55,4,'1996-10-25',3,10338)
			,(51,2,'1996-10-28',2,10339)
			,(9,1,'1996-10-29',3,10340)
			,(73,7,'1996-10-29',3,10341)
			,(25,4,'1996-10-30',2,10342)
			,(44,4,'1996-10-31',1,10343)
			,(89,4,'1996-11-01',2,10344)
			,(63,2,'1996-11-04',2,10345)
			,(65,3,'1996-11-05',3,10346)
			,(21,4,'1996-11-06',3,10347)
			,(86,4,'1996-11-07',2,10348)
			,(75,7,'1996-11-08',1,10349)
			,(41,6,'1996-11-11',2,10350)
			,(20,1,'1996-11-11',1,10351)
			,(28,3,'1996-11-12',3,10352)
			,(59,7,'1996-11-13',3,10353)
			,(58,8,'1996-11-14',3,10354)
			,(4,6,'1996-11-15',1,10355)
			,(86,6,'1996-11-18',2,10356)
			,(46,1,'1996-11-19',3,10357)
			,(41,5,'1996-11-20',1,10358)
			,(72,5,'1996-11-21',3,10359)
			,(7,4,'1996-11-22',3,10360)
			,(63,1,'1996-11-22',2,10361)
			,(9,3,'1996-11-25',1,10362)
			,(17,4,'1996-11-26',3,10363)
			,(19,1,'1996-11-26',1,10364)
			,(3,3,'1996-11-27',2,10365)
			,(29,8,'1996-11-28',2,10366)
			,(83,7,'1996-11-28',3,10367)
			,(20,2,'1996-11-29',2,10368)
			,(75,8,'1996-12-02',2,10369)
			,(14,6,'1996-12-03',2,10370)
			,(41,1,'1996-12-03',1,10371)
			,(62,5,'1996-12-04',2,10372)
			,(37,4,'1996-12-05',3,10373)
			,(91,1,'1996-12-05',3,10374)
			,(36,3,'1996-12-06',2,10375)
			,(51,1,'1996-12-09',2,10376)
			,(72,1,'1996-12-09',3,10377)
			,(24,5,'1996-12-10',3,10378)
			,(61,2,'1996-12-11',1,10379)
			,(37,8,'1996-12-12',3,10380)
			,(46,3,'1996-12-12',3,10381)
			,(20,4,'1996-12-13',1,10382)
			,(4,8,'1996-12-16',3,10383)
			,(5,3,'1996-12-16',3,10384)
			,(75,1,'1996-12-17',2,10385)
			,(21,9,'1996-12-18',3,10386)
			,(70,1,'1996-12-18',2,10387)
			,(72,2,'1996-12-19',1,10388)
			,(10,4,'1996-12-20',2,10389)
			,(20,6,'1996-12-23',1,10390)
			,(17,3,'1996-12-23',3,10391)
			,(59,2,'1996-12-24',3,10392)
			,(71,1,'1996-12-25',3,10393)
			,(36,1,'1996-12-25',3,10394)
			,(35,6,'1996-12-26',1,10395)
			,(25,1,'1996-12-27',3,10396)
			,(60,5,'1996-12-27',1,10397)
			,(71,2,'1996-12-30',3,10398)
			,(83,8,'1996-12-31',3,10399)
			,(19,1,'1997-01-01',3,10400)
			,(65,1,'1997-01-01',1,10401)
			,(20,8,'1997-01-02',2,10402)
			,(20,4,'1997-01-03',3,10403)
			,(49,2,'1997-01-03',1,10404)
			,(47,1,'1997-01-06',1,10405)
			,(62,7,'1997-01-07',1,10406)
			,(56,2,'1997-01-07',2,10407)
			,(23,8,'1997-01-08',1,10408)
			,(54,3,'1997-01-09',1,10409)
			,(10,3,'1997-01-10',3,10410)
			,(10,9,'1997-01-10',3,10411)
			,(87,8,'1997-01-13',2,10412)
			,(41,3,'1997-01-14',2,10413)
			,(21,2,'1997-01-14',3,10414)
			,(36,3,'1997-01-15',1,10415)
			,(87,8,'1997-01-16',3,10416)
			,(73,4,'1997-01-16',3,10417)
			,(63,4,'1997-01-17',1,10418)
			,(68,4,'1997-01-20',2,10419)
			,(88,3,'1997-01-21',1,10420)
			,(61,8,'1997-01-21',1,10421)
			,(27,2,'1997-01-22',1,10422)
			,(31,6,'1997-01-23',3,10423)
			,(51,7,'1997-01-23',2,10424)
			,(41,6,'1997-01-24',2,10425)
			,(29,4,'1997-01-27',1,10426)
			,(59,4,'1997-01-27',2,10427)
			,(66,7,'1997-01-28',1,10428)
			,(37,3,'1997-01-29',2,10429)
			,(20,4,'1997-01-30',1,10430)
			,(10,4,'1997-01-30',2,10431)
			,(75,3,'1997-01-31',2,10432)
			,(60,3,'1997-02-03',3,10433)
			,(24,3,'1997-02-03',2,10434)
			,(16,8,'1997-02-04',2,10435)
			,(7,3,'1997-02-05',2,10436)
			,(87,8,'1997-02-05',1,10437)
			,(79,3,'1997-02-06',2,10438)
			,(51,6,'1997-02-07',3,10439)
			,(71,4,'1997-02-10',2,10440)
			,(55,3,'1997-02-10',2,10441)
			,(20,3,'1997-02-11',2,10442)
			,(66,8,'1997-02-12',1,10443)
	  ) AS S ([CustID], [EmpID], [OrderDate], [ShipID], [OrderID])
	ON T.[OrderID] = S.[OrderID]
WHEN MATCHED AND ISNULL(T.[CustID], '') != ISNULL(S.[CustID], '') OR ISNULL(T.[EmpID], '') != ISNULL(S.[EmpID], '') OR ISNULL(T.[OrderDate], '') != ISNULL(S.[OrderDate], '') OR ISNULL(T.[ShipID], '') != ISNULL(S.[ShipID], '')
	THEN UPDATE SET T.[CustID] = S.[CustID], T.[EmpID] = S.[EmpID], T.[OrderDate] = S.[OrderDate], T.[ShipID] = S.[ShipID]
WHEN NOT MATCHED BY TARGET 
	THEN INSERT ([CustID], [EmpID], [OrderDate], [ShipID], [OrderID])
		 VALUES (S.[CustID], S.[EmpID], S.[OrderDate], S.[ShipID], S.[OrderID])
WHEN NOT MATCHED BY SOURCE 
	THEN DELETE
;
SET IDENTITY_INSERT [dbo].[Orders] OFF;
GO
