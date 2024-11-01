MERGE INTO Employees AS T
USING (
        VALUES
			 ('Davolio','Nancy', DATE '1968-12-08','EmpID1.pic','Education includes a BA in psychology from Colorado State University. She also completed (The Art of the Cold Call). Nancy is a member of "Toastmasters International".',1)
			,('Fuller','Andrew', DATE '1952-02-19','EmpID2.pic','Andrew received his BTS commercial and a Ph.D. in international marketing from the University of Dallas. He is fluent in French and Italian and reads German. He joined the company as a sales representative, was promoted to sales manager and was then named vice president of sales. Andrew is a member of the Sales Management Roundtable, the Seattle Chamber of Commerce, and the Pacific Rim Importers Association.',2)
			,('Leverling','Janet', DATE '1963-08-30','EmpID3.pic','Janet has a BS degree in chemistry from Boston College). She has also completed a certificate program in food retailing management. Janet was hired as a sales associate and was promoted to sales representative.',3)
			,('Peacock','Margaret',DATE '1958-09-19','EmpID4.pic','Margaret holds a BA in English literature from Concordia College and an MA from the American Institute of Culinary Arts. She was temporarily assigned to the London office before returning to her permanent post in Seattle.',4)
			,('Buchanan','Steven', DATE '1955-03-04','EmpID5.pic','Steven Buchanan graduated from St. Andrews University, Scotland, with a BSC degree. Upon joining the company as a sales representative, he spent 6 months in an orientation program at the Seattle office and then returned to his permanent post in London, where he was promoted to sales manager. Mr. Buchanan has completed the courses "Successful Telemarketing" and "International Sales Management". He is fluent in French.',5)
			,('Suyama','Michael', DATE '1963-07-02','EmpID6.pic','Michael is a graduate of Sussex University (MA, economics) and the University of California at Los Angeles (MBA, marketing). He has also taken the courses "Multi-Cultural Selling" and "Time Management for the Sales Professional". He is fluent in Japanese and can read and write French, Portuguese, and Spanish.',6)
			,('King','Robert', DATE '1960-05-29','EmpID7.pic','Robert King served in the Peace Corps and traveled extensively before completing his degree in English at the University of Michigan and then joining the company. After completing a course entitled "Selling in Europe", he was transferred to the London office.',7)
			,('Callahan','Laura', DATE '1958-01-09','EmpID8.pic','Laura received a BA in psychology from the University of Washington. She has also completed a course in business French. She reads and writes French.',8)
			,('Dodsworth','Anne', DATE '1969-07-02','EmpID9.pic','Anne has a BA degree in English from St. Lawrence College. She is fluent in French and German.',9)
			,('West','Adam', DATE '1928-09-19','EmpID10.pic','An old chum',10)

) AS S (LastName, FirstName, BirthDate, Photo, Notes, EmployeeID)
ON T.EmployeeID = S.EmployeeID
WHEN MATCHED AND (T.LastName IS DISTINCT FROM S.LastName OR 
                  T.FirstName IS DISTINCT FROM S.FirstName OR
                  T.BirthDate IS DISTINCT FROM S.BirthDate OR
                  T.Photo IS DISTINCT FROM S.Photo OR
                  T.Notes IS DISTINCT FROM S.Notes)
    THEN UPDATE 
        SET LastName = S.LastName,
            FirstName = S.FirstName,
            BirthDate = S.BirthDate,
            Photo = S.Photo,
            Notes = S.Notes
WHEN NOT MATCHED 
    THEN INSERT (LastName, FirstName, BirthDate, Photo, Notes, EmployeeID)
         VALUES (S.LastName, S.FirstName, S.BirthDate, S.Photo, S.Notes, S.EmployeeID);