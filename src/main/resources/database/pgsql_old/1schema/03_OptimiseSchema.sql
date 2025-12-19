
-- 1. **Categories Table:** - Index on CategoryName for faster lookups.
CREATE INDEX IF NOT EXISTS idx_category_name ON public."Categories" ("CategoryName");

-- 2. **Customers Table**: - Index on `CustomerName` for faster lookups.
CREATE INDEX IF NOT EXISTS idx_customer_name ON public."Customers" ("CustomerName");

-- 3. **Employees Table**: - Composite index on `LastName` and `FirstName` for faster lookups.
CREATE INDEX IF NOT EXISTS idx_employee_name ON public."Employees" ("LastName", "FirstName");

-- 4. **Orders Table**: - Index on `CustID` for faster joins with the `Customers` table. - Index on `EmpID` for faster joins with the `Employees` table. - Index on `ShipID` for faster joins with the `Shippers` table.
CREATE INDEX IF NOT EXISTS idx_orders_custid ON public."Orders" ("CustID");
CREATE INDEX IF NOT EXISTS idx_orders_empid ON public."Orders" ("EmpID");
CREATE INDEX IF NOT EXISTS idx_orders_shipid ON public."Orders" ("ShipID");

-- 5. **Products Table**: - Index on `SuplID` for faster joins with the `Suppliers` table. - Index on `CatID` for faster joins with the `Categories` table.
CREATE INDEX IF NOT EXISTS idx_products_suplid ON public."Products" ("SuplID");
CREATE INDEX IF NOT EXISTS idx_products_catid ON public."Products" ("CatID");


-- 6. **OrderDetails Table**: - Index on `OrdID` for faster joins with the `Orders` table. - Index on `ProdID` for faster joins with the `Products` table.
CREATE INDEX IF NOT EXISTS idx_orderdetails_ordid ON public."OrderDetails" ("OrdID");
CREATE INDEX IF NOT EXISTS idx_orderdetails_prodid ON public."OrderDetails" ("ProdID");
