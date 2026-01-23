--String functions
select * from  Sales.Customers;
select * from  Sales.Employees;
select * from  Sales.Orders;
select * from  Sales.OrdersArchive;
select * from  Sales.Products;

select * from  Sales.Customers;

--concat
select 
	firstName,
	LastName,
	CONCAT(firstName,' ',LastName) as name
from Sales.Customers;

--lower and upper
select 
	firstName,
	LastName,
	lower(FirstName)  as firstName1,
	upper(LastName) as lastname1
from Sales.Customers;

--Trim

select 
	1 as id,
	trim('   Adithya' )as name;

--replace
select * from  Sales.Employees;

select 
	*,
	replace(BirthDate,'-','/') as ReplcedBirthDate
from Sales.Employees;

--length
select 
	*,
	len(FirstName) as lengthoffirstname
from Sales.Employees;

--left and right
select
	Department,
	left(Department,2) as leftString,
	right(Department,2) as rightString
from Sales.Employees;

--substring
select
	Department,
	substring(Department,3,4) as sub
from Sales.Employees;

--numeric functions

--abs function
select 
	abs(-1) as number;

--round function
select
	1.55212 as number,
	round(1.55212,2) as round_2,
	round(1.55212,3) as round_3;