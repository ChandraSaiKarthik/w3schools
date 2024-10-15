DROP VIEW IF EXISTS vw_category_sales_by_month;

CREATE VIEW vw_category_sales_by_month AS
SELECT 
    TO_CHAR(O.orderdate, 'YYYY-MM') AS month_name,
    C.categoryname,
    SUM(OD.quantity * P.price) AS total_price_per_month
FROM 
    orders AS O
    INNER JOIN orderdetails AS OD ON OD.orderid = O.orderid
    INNER JOIN products AS P ON P.productid = OD.productid
    INNER JOIN categories AS C ON C.categoryid = P.categoryid
GROUP BY 
    TO_CHAR(O.orderdate, 'YYYY-MM'),
    C.categoryname;