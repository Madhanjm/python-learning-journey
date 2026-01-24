select * from Sales.Orders;

--Display OrderID, CreationTime, a hard-coded date, and the current system date.
select
	OrderID,
	CreationTime,
	'2026-01-23' as hardcoded,
	GETDATE() as today
from Sales.Orders;

--Extract various parts of CreationTime using DATETRUNC, DATENAME, DATEPART,
--YEAR, MONTH, and DAY.

select
	OrderID,
	CreationTime,
	--datetrunc
	DATETRUNC(year,CreationTime) as trunc_year,
	DATETRUNC(month,CreationTime) as trunc_month,
	DATETRUNC(minute,CreationTime) as trunc_min,

	--datename

	DATENAME(year,CreationTime) as datename_year,
	DATENAME(month,CreationTime) as datename_month,
	DATENAME(day,CreationTime) as datename_day,
	DATENAME(weekday,CreationTime) as datename_weekday,

	--datepart
	DATEPART(year,CreationTime) as datepart_year,
	DATEPART(month,CreationTime) as datepart_month,
	DATEPART(day,CreationTime) as datepart_day,
	DATEPART(quarter,CreationTime) as datepart_quarter,
	DATEPART(hour,CreationTime) as datepart_hour,
	DATEPART(week,CreationTime) as datepart_week,
	YEAR(CreationTime) AS Year,
    MONTH(CreationTime) AS Month,
    DAY(CreationTime) AS Day

from Sales.Orders;

--Aggregate orders by year using DATETRUNC on CreationTime.
select * from Sales.Orders;

select 
	DATETRUNC(year,CreationTime) as creation,
	count(*) as OrderCount
from Sales.Orders
GROUP BY DATETRUNC(year,CreationTime);

--Display OrderID, CreationTime, and the end-of-month date for CreationTime.
select * from Sales.Orders;


select 
	OrderID,
	CreationTime,
	EOMONTH(CreationTime) as EOM
from Sales.Orders;

--How many orders were placed each year?
select
	YEAR(OrderDate) as years,
	count(*) as totalorders
from Sales.Orders
group by YEAR(OrderDate);

-- How many orders were placed each month?

select 
	MONTH(OrderDate) as months,
	count(*) as totalorders
from Sales.Orders
group by MONTH(OrderDate);

--How many orders were placed each month (using friendly month names)?

select * from Sales.Orders;

select 
	DATENAME(month,OrderDate) as Months,
	count(*) as TotalOrders
from Sales.Orders
group by DATENAME(month,OrderDate);

-- Show all orders that were placed during the month of February.
select 
	*
from Sales.Orders
where MONTH(OrderDate)=2;

-- Format CreationTime into various string representations.

SELECT
    OrderID,
    CreationTime,
    FORMAT(CreationTime, 'MM-dd-yyyy') AS USA_Format,
    FORMAT(CreationTime, 'dd-MM-yyyy') AS EURO_Format,
    FORMAT(CreationTime, 'dd') AS dd,
    FORMAT(CreationTime, 'ddd') AS ddd,
    FORMAT(CreationTime, 'dddd') AS dddd,
    FORMAT(CreationTime, 'MM') AS MM,
    FORMAT(CreationTime, 'MMM') AS MMM,
    FORMAT(CreationTime, 'MMMM') AS MMMM
FROM Sales.Orders;

--Display CreationTime using a custom format:
  -- Example: Day Wed Jan Q1 2025 12:34:56 PM
  select 
		OrderId,
		CreationTime,
		'Day '+FORMAT(CreationTime,'ddd MMM')+' Q'+DATENAME(QUARTER,CreationTime)+' '+FORMAT(CreationTime,'yyyy hh:mm:ss tt')as customformat
		from Sales.Orders;

--How many orders were placed each year, formatted by month and year (e.g., "Jan 25")?
select * from Sales.Orders;

select 
	FORMAT(OrderDate,'MMM yy') as month_year,
	count(*) as TotalOrder
from Sales.Orders
Group BY FORMAT(OrderDate,'MMM yy');

---  Demonstrate conversion using CONVERT.
SELECT
    CONVERT(INT, '123') AS [String to Int CONVERT],
    CONVERT(DATE, '2025-08-20') AS [String to Date CONVERT],
    CreationTime,
    CONVERT(DATE, CreationTime) AS [Datetime to Date CONVERT],
    CONVERT(VARCHAR, CreationTime, 32) AS [USA Std. Style:32],
    CONVERT(VARCHAR, CreationTime, 34) AS [EURO Std. Style:34]
FROM Sales.Orders;

 --Convert data types using CAST.
 SELECT
    CAST('123' AS INT) AS [String to Int],
    CAST(123 AS VARCHAR) AS [Int to String],
    CAST('2025-08-20' AS DATE) AS [String to Date],
    CAST('2025-08-20' AS DATETIME2) AS [String to Datetime],
    CreationTime,
    CAST(CreationTime AS DATE) AS [Datetime to Date]
FROM Sales.Orders;

--Perform date arithmetic on OrderDate.
SELECT
    OrderID,
    OrderDate,
    DATEADD(day, -10, OrderDate) AS TenDaysBefore,
    DATEADD(month, 3, OrderDate) AS ThreeMonthsLater,
    DATEADD(year, 2, OrderDate) AS TwoYearsLater
FROM Sales.Orders;

-- Calculate the age of employees.
select 
	*,
	DATEDIFF(year,BirthDate,GETDATE()) as age
from Sales.Employees;

--Find the average shipping duration in days for each month.
select * from Sales.Orders;

select 
	MONTH(OrderDate) as months,
	avg(DATEDIFF(DAY,OrderDate,ShipDate)) as [avg day]
from Sales.Orders
group by MONTH(OrderDate);

--Time Gap Analysis: Find the number of days between each order and the previous order.
SELECT
    OrderID,
    OrderDate AS CurrentOrderDate,
    LAG(OrderDate) OVER (ORDER BY OrderDate) AS PreviousOrderDate,
    DATEDIFF(day, LAG(OrderDate) OVER (ORDER BY OrderDate), OrderDate) AS NrOfDays
FROM Sales.Orders;

--  Validate OrderDate using ISDATE and convert valid dates.
SELECT
    OrderDate,
    ISDATE(OrderDate) AS IsValidDate,
    CASE 
        WHEN ISDATE(OrderDate) = 1 THEN CAST(OrderDate AS DATE)
        ELSE '9999-01-01'
    END AS NewOrderDate
FROM (
    SELECT '2025-08-20' AS OrderDate UNION
    SELECT '2025-08-21' UNION
    SELECT '2025-08-23' UNION
    SELECT '2025-08'
) AS t

 