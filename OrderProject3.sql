SELECT * FROM [Order]



--What is the total sales for each product category?
SELECT  p.Category, 
		ROUND(SUM(Sales),2) AS 'Total Sales'
FROM [Order] o
	 LEFT JOIN Product p
ON o.Product_ID = p.Product_ID
GROUP BY p.Category
ORDER BY 'Total Sales' DESC;


--List the top 5 most profitable orders (Just list their OrderID)
SELECT  Top 5 o.Order_ID,
		SUM(o.Profit) 'Total Profit'
FROM [Order] o
GROUP BY Order_ID
ORDER BY 'Total Profit' DESC;


--How many customers are there in each segment?
SELECT  c.Segment,
		COUNT(c.Customer_ID) AS 'Total Customers'
FROM Customer c
GROUP BY c.Segment
ORDER BY 'Total Customers' DESC;


--Find the average discount given by each product sub-category.
SELECT p.Sub_category,
ROUND(AVG(o.Discount),2) 'Average Discount'
FROM [Order] o
LEFT JOIN Product p
ON o.Product_ID = p.Product_ID
GROUP BY p.Sub_Category
ORDER BY 'Average Discount' DESC;


--List all orders with more than 3 items that have a profit of $500.
SELECT o.Order_ID
FROM [Order] o
GROUP BY o.Order_ID
HAVING COUNT(*) > 3 AND SUM(Profit) = 500;


--What is the total quantity of products sold in each region?
SELECT loc.Region,
SUM(o.Quantity) 'Total Quantity'
FROM [Order] o
LEFT JOIN [Location] loc
ON o.CountryID = loc.CountryID
GROUP BY loc.Region
ORDER BY 'Total Quantity' DESC;


--Which product categories are generating the most revenue?
SELECT Top 1 p.Category,
ROUND(SUM(o.Sales),2) 'Total Revenue'
FROM [Order] o
LEFT JOIN Product p
ON o.Product_ID = p.Product_ID
GROUP BY p.Category
ORDER BY 'Total Revenue' DESC;


--List the customers names and the number of orders they placed in descending order.
SELECT c.Customer_Name, 
COUNT(o.Quantity) 'Number of Orders'
FROM [Order] o
LEFT JOIN Customer c
ON o.Customer_ID = c.Customer_ID
GROUP BY c.Customer_Name
ORDER BY 'Number of Orders' DESC;


--Which product has the highest average discount across all orders?
SELECT Top 1 p.Product_Name,
ROUND(AVG(o.Discount),2) 'Average Discount'
FROM [Order] o
LEFT JOIN Product p
ON o.Product_ID = p.Product_ID
GROUP BY Product_Name
ORDER BY 'Average Discount' DESC;


--How many orders were placed in each quarter of the year 2015?
SELECT DATEPART(Quarter, Order_Date) 'Quarter(2015)',
COUNT(*) 'Orders Placed'
FROM [Order] 
WHERE YEAR(Order_Date) = 2015
GROUP BY  DATEPART(Quarter, Order_Date)
ORDER BY 'Orders Placed' ;


--For each product category, find the day of the week with the highest average sales.
SELECT p.Category, 
DATENAME(WEEKDAY,o.Order_Date) 'Day of Week',
ROUND(AVG(o.Sales),2) 'Average Sales'
FROM [Order] o
LEFT JOIN Product p
ON o.Product_ID = p.Product_ID
GROUP BY p.Category, DATENAME(WEEKDAY,o.Order_Date)
ORDER BY 'Average Sales' DESC;