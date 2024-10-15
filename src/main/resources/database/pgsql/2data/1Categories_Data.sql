MERGE INTO Categories AS T
USING (
        VALUES
            ('Beverages', 'Soft drinks, coffees, teas, beers and ales', 1),
            ('Condiments', 'Sweet and savory sauces, relishes, spreads and seasonings', 2),
            ('Confections', 'Desserts, candies and sweet breads', 3),
            ('Dairy Products', 'Cheeses', 4),
            ('Grains/Cereals', 'Breads, crackers, pasta and cereal', 5),
            ('Meat/Poultry', 'Prepared meats', 6),
            ('Produce', 'Dried fruit and bean curd', 7),
            ('Seafood', 'Seaweed and fish', 8)
) AS S (CategoryName, Description, CategoryID)
    ON T.CategoryID = S.CategoryID
WHEN MATCHED AND (T.CategoryName IS DISTINCT FROM S.CategoryName OR 
                  T.Description IS DISTINCT FROM S.Description)
    THEN UPDATE 
        SET CategoryName = S.CategoryName,
            Description = S.Description
WHEN NOT MATCHED 
    THEN INSERT (CategoryName, Description, CategoryID)
         VALUES (S.CategoryName, S.Description, S.CategoryID);