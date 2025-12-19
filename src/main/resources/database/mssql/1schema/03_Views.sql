USE [<<Database>>];
GO

IF OBJECT_ID('dbo.vw_ProductSalesByMonth', 'V') IS NOT NULL
	DROP VIEW dbo.vw_ProductSalesByMonth;
GO

CREATE VIEW dbo.vw_ProductSalesByMonth
AS
SELECT FORMAT(O.OrderDate, 'yyyy-MM') AS "Month_Name",
	   P.ProductName,
	   SUM(OD.Quantity) AS "TotalQuantityPerMonth",
	   SUM(OD.Quantity * P.Price) AS "TotalPricePerMonth"
FROM dbo.Orders AS O
INNER JOIN dbo.OrderDetails AS OD ON OD.OrdID = O.OrderID
INNER JOIN dbo.Products AS P ON P.ProductID = OD.ProdID
GROUP BY FORMAT(O.OrderDate, 'yyyy-MM'), P.ProductName;