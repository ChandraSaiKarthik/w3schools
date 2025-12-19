MERGE INTO public.categories AS T
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
        ) AS S (category_id, category_name, description)
    ON T.category_id = S.category_id
WHEN MATCHED AND (T.category_name IS DISTINCT FROM S.category_name OR T.description IS DISTINCT FROM S.description)
    THEN UPDATE SET category_name = S.category_name, description = S.description
WHEN NOT MATCHED
    THEN INSERT (category_id, category_name, description)
         OVERRIDING SYSTEM VALUE
         VALUES (S.category_id, S.category_name, S.description)
;
SELECT setval('public.categories_category_id_seq', (SELECT MAX(category_id) FROM public.categories));