CREATE DATABASE InventoryAnalysis;
GO

USE InventoryAnalysis;
GO

SELECT *
FROM Inventory;





SELECT
    Product_ID,
    Product_Name,
    Category,
    Opening_Inventory,
    Closing_Inventory,
    Units_Sold,
    Unit_Cost,
    (Opening_Inventory + Closing_Inventory) / 2.0 AS Calc_Avg_Inventory,
    Units_Sold * Unit_Cost AS Calc_COGS,
    ROUND(
    Units_Sold /
    ((Opening_Inventory + Closing_Inventory) / 2.0),
    2
) AS Calc_Turnover
FROM Inventory
ORDER BY Calc_Turnover;


SELECT
    Product_Name,
    Inventory_Turnover AS Original_Turnover,
    ROUND(COGS / Average_Inventory, 2) AS COGS_div_AvgUnits,
    ROUND(Units_Sold / Average_Inventory, 2) AS Units_div_AvgUnits,
    ROUND(COGS / (Average_Inventory * Unit_Cost), 2) AS COGS_div_AvgValue
FROM Inventory
ORDER BY Product_Name;


WITH T AS (
    SELECT (Units_Sold * Unit_Cost) /
           (((Opening_Inventory + Closing_Inventory) / 2.0) * Unit_Cost) AS Turnover
    FROM Inventory
)
SELECT ROUND(AVG(Turnover), 2) AS Avg_Turnover FROM T;


WITH T AS (
    SELECT Product_ID, Product_Name, Category, Units_Sold,
           (Opening_Inventory + Closing_Inventory) / 2.0 AS Avg_Inventory,
           (Units_Sold * Unit_Cost) /
           (((Opening_Inventory + Closing_Inventory) / 2.0) * Unit_Cost) AS Turnover
    FROM Inventory
)
SELECT Product_ID, Product_Name, Category, Avg_Inventory, Units_Sold,
       ROUND(Turnover, 2) AS Inventory_Turnover
FROM T
WHERE Turnover <= (SELECT AVG(Turnover) FROM T)
ORDER BY Turnover;


WITH T AS (
    SELECT Category, Unit_Cost, Units_Sold,
           (Opening_Inventory + Closing_Inventory) / 2.0 AS Avg_Inventory,
           (Units_Sold * Unit_Cost) /
           (((Opening_Inventory + Closing_Inventory) / 2.0) * Unit_Cost) AS Turnover
    FROM Inventory
),
Overall AS (
    SELECT AVG(Turnover) AS Overall_Avg FROM T
)
SELECT
    T.Category,
    COUNT(*) AS Products,
    SUM(T.Units_Sold * T.Unit_Cost) AS Total_COGS,
    SUM(T.Avg_Inventory) AS Total_Avg_Inventory,
    ROUND(AVG(T.Turnover), 2) AS Avg_Turnover,
    SUM(CASE WHEN T.Turnover <= O.Overall_Avg
             THEN 1 ELSE 0 END) AS Slow_Moving_Products
FROM T
CROSS JOIN Overall O
GROUP BY T.Category
ORDER BY Avg_Turnover DESC;


SELECT
    Product_ID,
    Product_Name,
    Opening_Inventory,
    Purchases,
    Units_Sold,
    Closing_Inventory,
    Opening_Inventory + Purchases - Units_Sold AS Calculated_Closing,
    CASE
        WHEN Opening_Inventory + Purchases - Units_Sold = Closing_Inventory
        THEN 'Correct'
        ELSE 'Mismatch'
    END AS Inventory_Check
FROM Inventory;


SELECT TOP 5
    Product_ID,
    Product_Name,
    Category,
    ROUND(
        (Units_Sold * Unit_Cost) /
        (((Opening_Inventory + Closing_Inventory) / 2.0) * Unit_Cost),
        2
    ) AS Inventory_Turnover
FROM Inventory
ORDER BY Inventory_Turnover ASC;


SELECT TOP 5
    Product_ID,
    Product_Name,
    Category,
    ROUND(
    Units_Sold /
    ((Opening_Inventory + Closing_Inventory) / 2.0),
    2
) AS Inventory_Turnover
FROM Inventory
ORDER BY Inventory_Turnover DESC;