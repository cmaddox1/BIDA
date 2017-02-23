USE AdventureWorks2012; /*Set current database*/

/*1. Show card type and number of customers for each type of credit cards.*/
/* Tables: Sales.CreditCard, Sales.PersonCreditCard*/
SELECT count(CardType)
FROM Sales.CreditCard, Sales.PersonCreditCard
Group By CardType;


/*2. Show the product ID, product name, and list price for each product where the list price is higher than the average standard cost for all products. */
/* Table: Production.Product*/
SELECT ProductID,[Name],ListPrice
FROM Production.Product
WHERE ListPrice >
(SELECT AVG(StandardCost)
FROM Production.Product);


/*3. Show the product category name, subcategory name, product name, and product ID for all products that belong to a category and subcategory. These should be sorted alphabetically by category name, within category by subcategory name, and within subcategory by product name. Note: your result set should produce a total of 295 rows. */
/* Tables: Production.Product, Production.ProductSubcategory, Production.ProductCategory*/
SELECT PP.[name],PP.ProductSubcategoryID,PC.[Name]
FROM Production.Product as PP, Production.ProductSubcategory as PS, Production.ProductCategory as PC
Group By PC.[Name]


/*4. Modify the query above (query 3) so that it includes only those products that do not belong to a category or subcategory. Note: your result set should produce a total of 209 rows. */
