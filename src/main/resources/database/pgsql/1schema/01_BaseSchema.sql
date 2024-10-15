CREATE SEQUENCE IF NOT EXISTS "public"."categories_categoryid_seq" START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

CREATE TABLE IF NOT EXISTS "public"."Categories"
    (
        "CategoryID"   int NOT NULL DEFAULT nextval ( '"public"."categories_categoryid_seq"'::regclass ),
        "CategoryName" varchar ( 50 ) NULL,
        "Description"  varchar ( 100 ) NULL,
        CONSTRAINT "PK_CategoryID" PRIMARY KEY ( "CategoryID" ),
        CONSTRAINT "UK_CategoryName" UNIQUE ( "CategoryName" )
    )
;/*LVL:0*/

CREATE SEQUENCE IF NOT EXISTS "public"."customers_customerid_seq" START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
CREATE TABLE IF NOT EXISTS "public"."Customers"
    (
        "CustomerID"   int NOT NULL DEFAULT nextval ( '"public"."customers_customerid_seq"'::regclass ),
        "CustomerName" varchar ( 50 ) NULL,
        "ContactName"  varchar ( 50 ) NULL,
        "Address"      varchar ( 50 ) NULL,
        "City"         varchar ( 50 ) NULL,
        "PostalCode"   varchar ( 50 ) NULL,
        "Country"      varchar ( 50 ) NULL,
        CONSTRAINT "PK_CustomerID" PRIMARY KEY ( "CustomerID" ),
        CONSTRAINT "UK_CustomerName" UNIQUE ( "CustomerName" )
    )
;/*LVL:0*/

CREATE SEQUENCE IF NOT EXISTS "public"."employees_employeeid_seq" START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
CREATE TABLE IF NOT EXISTS "public"."Employees"
    (
        "EmployeeID" int NOT NULL DEFAULT nextval ( '"public"."employees_employeeid_seq"'::regclass ),
        "LastName"   varchar ( 50 ) NULL,
        "FirstName"  varchar ( 50 ) NULL,
        "BirthDate"  date NULL,
        "Photo"      varchar ( 50 ) NULL,
        "Notes"      varchar ( 4000 ) NULL,
        CONSTRAINT "PK_EmployeeID" PRIMARY KEY ( "EmployeeID" ),
        CONSTRAINT "UK_EmployeeName" UNIQUE ( "FirstName", "LastName" )
    )
;/*LVL:0*/

CREATE SEQUENCE IF NOT EXISTS "public"."shippers_shipperid_seq" START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
CREATE TABLE IF NOT EXISTS "public"."Shippers"
    (
        "ShipperID"   int NOT NULL DEFAULT nextval ( '"public"."shippers_shipperid_seq"'::regclass ),
        "ShipperName" varchar ( 50 ) NULL,
        "Phone"       varchar ( 15 ) NULL,
        CONSTRAINT "PK_ShipperID" PRIMARY KEY ( "ShipperID" ),
        CONSTRAINT "UK_ShipperName" UNIQUE ( "ShipperName" )
    )
;/*LVL:0*/

CREATE SEQUENCE IF NOT EXISTS "public"."suppliers_supplierid_seq" START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
CREATE TABLE IF NOT EXISTS "public"."Suppliers"
    (
        "SupplierID"   int NOT NULL DEFAULT nextval ( '"public"."suppliers_supplierid_seq"'::regclass ),
        "SupplierName" varchar ( 50 ) NULL,
        "ContactName"  varchar ( 50 ) NULL,
        "Address"      varchar ( 50 ) NULL,
        "City"         varchar ( 50 ) NULL,
        "PostalCode"   varchar ( 50 ) NULL,
        "Country"      varchar ( 50 ) NULL,
        CONSTRAINT "PK_SupplierID" PRIMARY KEY ( "SupplierID" ),
        CONSTRAINT "UK_SupplierName" UNIQUE ( "SupplierName" )
    )
;/*LVL:0*/

CREATE SEQUENCE IF NOT EXISTS "public"."orders_orderid_seq" START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
CREATE TABLE IF NOT EXISTS "public"."Orders"
    (
        "OrderID"   int NOT NULL DEFAULT nextval ( '"public"."orders_orderid_seq"'::regclass ),
        "CustID"    int NULL,
        "EmpID"     int NULL,
        "OrderDate" date NULL,
        "ShipID"    int NULL,
        CONSTRAINT "PK_OrderID" PRIMARY KEY ( "OrderID" ),
        CONSTRAINT "CustID=dbo.Customers.CustomerID" FOREIGN KEY ( "CustID" ) REFERENCES "public"."Customers" ( "CustomerID" ) ON UPDATE CASCADE ON DELETE CASCADE,
        CONSTRAINT "EmpID=dbo.Employees.EmployeeID" FOREIGN KEY ( "EmpID" ) REFERENCES "public"."Employees" ( "EmployeeID" ) ON UPDATE CASCADE ON DELETE CASCADE,
        CONSTRAINT "ShipID=dbo.Shippers.ShipperID" FOREIGN KEY ( "ShipID" ) REFERENCES "public"."Shippers" ( "ShipperID" ) ON UPDATE CASCADE ON DELETE CASCADE 
    )
;/*LVL:1*/

CREATE SEQUENCE IF NOT EXISTS "public"."products_productid_seq" START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
CREATE TABLE IF NOT EXISTS "public"."Products"
    (
        "ProductID"   int NOT NULL DEFAULT nextval ( '"public"."products_productid_seq"'::regclass ),
        "ProductName" varchar ( 50 ) NULL,
        "SuplID"      int NULL,
        "CatID"       int NULL,
        "Unit"        varchar ( 50 ) NULL,
        "Price"       decimal ( 18,2 ) NULL,
        CONSTRAINT "PK_ProductID" PRIMARY KEY ( "ProductID" ),
        CONSTRAINT "UK_ProductName" UNIQUE ( "ProductName" ),
        CONSTRAINT "CatID=dbo.Categories.CategoryID" FOREIGN KEY ( "CatID" ) REFERENCES "public"."Categories" ( "CategoryID" ) ON UPDATE CASCADE ON DELETE CASCADE,
        CONSTRAINT "SuplID=dbo.Suppliers.SupplierID" FOREIGN KEY ( "SuplID" ) REFERENCES "public"."Suppliers" ( "SupplierID" ) ON UPDATE CASCADE ON DELETE CASCADE
    )
;/*LVL:1*/

CREATE SEQUENCE IF NOT EXISTS "public"."orderdetails_orderdetailid_seq" START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
CREATE TABLE IF NOT EXISTS "public"."OrderDetails"
    (
        "OrderDetailID" int NOT NULL DEFAULT nextval ( '"public"."orderdetails_orderdetailid_seq"'::regclass ),
        "OrdID"         int NULL,
        "ProdID"        int NULL,
        "Quantity"      int NULL,
        CONSTRAINT "PK_OrderDetailID" PRIMARY KEY ( "OrderDetailID" ),
        CONSTRAINT "OrdID=dbo.Orders.OrderID" FOREIGN KEY ( "OrdID" ) REFERENCES "public"."Orders" ( "OrderID" ) ON UPDATE CASCADE ON DELETE CASCADE,
        CONSTRAINT "ProdID=dbo.Products.ProductID" FOREIGN KEY ( "ProdID" ) REFERENCES "public"."Products" ( "ProductID" ) ON UPDATE CASCADE ON DELETE CASCADE
    )
;/*LVL:2*/