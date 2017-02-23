USE AdventureWorks2012; /*Set current database*/


/*1, Display the total amount collected from the orders for each order date. */
SELECT OrderDate, Sum(TotalDue) as DailyAmount, Count(SalesOrderID) as
	Daily_Number_of_Orders
FROM Sales.SalesOrderHeader
GROUP BY OrderDate
ORDER BY OrderDate;


/*2, Display the total amount collected from selling the products, 774 and 777. */
SELECT ProductID, Sum(LineTotal) as Total_Amount,
AVG(UnitPrice) as AVG_Unit_Price
FROM Sales.SalesOrderDetail
Where ProductID=774 or ProductID= 777
Group By ProductID;




/*3, Write a query to display the sales person BusinessEntityID, last name and first name of all the sales persons and the name of the territory to which they belong.*/
SELECT BusinessEntityID,TerritoryID
From Sales.SalesPerson
Group by TerritoryID;



/*4,  Write a query to display the Business Entities of the customers that have the 'Vista' credit card.*/
/* Tables: Sales.CreditCard, Sales.PersonCreditCard, Person.Person*/
Select BusinessEntityID, 
From Sales.CreditCard, Sales.PersonCreditCard, Person.Person
Where Sales.CreditCard = 'Vista';




/*Show the number of customers for each type of credit cards*/




/*5, Write a query to display ALL the country region codes along with their corresponding territory IDs*/
/* tables: Sales.SalesTerritory*/
SELECT CR.CountryRegionCode, CR.Name, ST.TerritoryID
FROM Person.CountryRegion as CR
Left Join Sales.SalesTerritory as ST
on CR.CountryRegionCode=ST.CountryRegionCode
WHERE ST.TerritoryID is NULL;


/*6, Find out the average of the total dues of all the orders.*/
Select avg(TotalDue)
FROM Sales.SalesOrderHeader;


/*7, Write a query to report the sales order ID of those orders where the total due is greater than the average of the total dues of all the orders*/
Select SalesOrderID, TotalDue
FROM Sales.SalesOrderHeader
WHERE TotalDue >
(SELECT AVG(TotalDue)
FROM Sales.SalesOrderHeader)
ORDER BY TotalDue;


