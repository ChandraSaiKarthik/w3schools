-- Drop all tables
DO $$
DECLARE
    i_schema_name TEXT;
    i_table_name TEXT;
    SQLcmd TEXT;
BEGIN
    FOR i_schema_name, i_table_name IN
        SELECT table_schema, table_name
        FROM information_schema.tables
        WHERE table_schema NOT IN ('pg_catalog', 'information_schema')
        AND table_type = 'BASE TABLE'
    LOOP
        SQLcmd := 'DROP TABLE IF EXISTS ' || i_schema_name || '.' || i_table_name || ' CASCADE';
        EXECUTE SQLcmd;
        RAISE NOTICE 'Dropped Table: %.%', i_schema_name, i_table_name;
    END LOOP;
END $$;


CREATE TABLE IF NOT EXISTS Categories 
(
    CategoryID SERIAL,
    CategoryName VARCHAR(50),
    Description VARCHAR(100),
    CONSTRAINT PK_CategoryID PRIMARY KEY (CategoryID),
    CONSTRAINT UK_CategoryName UNIQUE (CategoryName)
); /*LVL:0*/

CREATE TABLE IF NOT EXISTS Customers 
(
    CustomerID SERIAL,
    CustomerName VARCHAR(50),
    ContactName VARCHAR(50),
    Address VARCHAR(50),
    City VARCHAR(50),
    PostalCode VARCHAR(50),
    Country VARCHAR(50),
    CONSTRAINT PK_CustomerID PRIMARY KEY (CustomerID),
    CONSTRAINT UK_CustomerName UNIQUE (CustomerName)
); /*LVL:0*/

CREATE TABLE IF NOT EXISTS Employees 
(
    EmployeeID SERIAL,
    LastName VARCHAR(50),
    FirstName VARCHAR(50),
    BirthDate DATE,
    Photo VARCHAR(50),
    Notes VARCHAR(4000),
    CONSTRAINT PK_EmployeeID PRIMARY KEY (EmployeeID),
    CONSTRAINT UK_EmployeeName UNIQUE (FirstName, LastName)
); /*LVL:0*/

CREATE TABLE IF NOT EXISTS Shippers 
(
    ShipperID SERIAL,
    ShipperName VARCHAR(50),
    Phone VARCHAR(15),
    CONSTRAINT PK_ShipperID PRIMARY KEY (ShipperID),
    CONSTRAINT UK_ShipperName UNIQUE (ShipperName)
); /*LVL:0*/

CREATE TABLE IF NOT EXISTS Suppliers 
(
    SupplierID SERIAL,
    SupplierName VARCHAR(50),
    ContactName VARCHAR(50),
    Address VARCHAR(50),
    City VARCHAR(50),
    PostalCode VARCHAR(50),
    Country VARCHAR(50),
    CONSTRAINT PK_SupplierID PRIMARY KEY (SupplierID),
    CONSTRAINT UK_SupplierName UNIQUE (SupplierName)
); /*LVL:0*/

CREATE TABLE IF NOT EXISTS Orders 
(
    OrderID SERIAL,
    CustomerID INT,
    EmployeeID INT,
    OrderDate DATE,
    ShipperID INT,
    CONSTRAINT PK_OrderID PRIMARY KEY (OrderID),
    CONSTRAINT "Orders.CustomerID=Customers.CustomerID" FOREIGN KEY (CustomerID) REFERENCES Customers (CustomerID) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT "Orders.EmployeeID=Employees.EmployeeID" FOREIGN KEY (EmployeeID) REFERENCES Employees (EmployeeID) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT "Orders.ShipperID=Shippers.ShipperID" FOREIGN KEY (ShipperID) REFERENCES Shippers (ShipperID) ON UPDATE CASCADE ON DELETE CASCADE
); /*LVL:1*/

CREATE TABLE IF NOT EXISTS Products 
(
    ProductID SERIAL,
    ProductName VARCHAR(50),
    SupplierID INT,
    CategoryID INT,
    Unit VARCHAR(50),
    Price DECIMAL(18, 2),
    CONSTRAINT PK_ProductID PRIMARY KEY (ProductID),
    CONSTRAINT UK_ProductName UNIQUE (ProductName),
    CONSTRAINT "Products.CategoryID=Categories.CategoryID" FOREIGN KEY (CategoryID) REFERENCES Categories (CategoryID) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT "Products.SupplierID=Suppliers.SupplierID" FOREIGN KEY (SupplierID) REFERENCES Suppliers (SupplierID) ON UPDATE CASCADE ON DELETE CASCADE
); /*LVL:1*/

CREATE TABLE IF NOT EXISTS OrderDetails 
(
    OrderDetailID SERIAL,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    CONSTRAINT PK_OrderDetailID PRIMARY KEY (OrderDetailID),
    CONSTRAINT "OrderDetails.OrderID=Orders.OrderID" FOREIGN KEY (OrderID) REFERENCES Orders (OrderID) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT "OrderDetails.ProductID=Products.ProductID" FOREIGN KEY (ProductID) REFERENCES Products (ProductID) ON UPDATE CASCADE ON DELETE CASCADE
); /*LVL:2*/