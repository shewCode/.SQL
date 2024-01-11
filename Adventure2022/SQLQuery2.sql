SELECT
    Production.Product.Name AS ProductName,
    Sales.SalesOrderHeader.SalesOrderID,
    COUNT(Sales.SalesOrderDetail.OrderQty) AS OrderCount,
    AVG(Sales.SalesOrderDetail.OrderQty) AS AverageOrderQty
FROM
    Sales.SalesOrderHeader
INNER JOIN
    Sales.SalesOrderDetail ON Sales.SalesOrderHeader.SalesOrderID = Sales.SalesOrderDetail.SalesOrderID
INNER JOIN
    Production.Product ON Sales.SalesOrderDetail.ProductID = Production.Product.ProductID
GROUP BY
    Production.Product.Name,
    Sales.SalesOrderHeader.SalesOrderID
ORDER BY
    ProductName,
    SalesOrderID;