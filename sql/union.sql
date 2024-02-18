--UNION kasutamine---
--ALEX kursus --
-- Kui JOIN oli, siis kuvas EmpID kahe erineva tulbana--
-- Unionil on 2 erinevat tabelit aga Emp ID kuvab kõik ühte--
SELECT *
FROM SQLTutorial.dbo.EmployeeDemographics
UNION
SELECT *
FROM SQLTutorial.dbO.WareHouseEmployeeDemographics

---UNION ALL - sees ka duplikaadid, mida hea --
--välja selgitada ORDER BY --
SELECT *
FROM SQLTutorial.dbo.EmployeeDemographics
UNION ALL
SELECT *
FROM SQLTutorial.dbO.WareHouseEmployeeDemographics
ORDER BY EmployeeID

--2. näide
SELECT *
FROM SQLTutorial.dbo.EmployeeDemographics
UNION
SELECT *
FROM SQLTutorial.dbO.EmployeeSalary

-- keerulisem ja tegelikult ebakorrektne --
-- võimalik läbi viia kuna on 3 & 3 anmdevälja
SELECT EmployeeID, FirstName, Age
FROM SQLTutorial.dbo.EmployeeDemographics
UNION
SELECT EmployeeID, JobTitle,Salary
FROM SQLTutorial.dbO.EmployeeSalary

--- kasutatakse samatüübiliste andmete ühendamiseksN.
--Näide: töötajate andmed, geogr piirkond --
-- saab kasutada koos Order BY v WHERE klausliga--

SELECT city
FROM Customers
UNION all
SELECT city FROM Suppliers
ORDER BY City;

SELECT city, country
FROM Customers
WHERE Country='Germany'
UNION all
SELECT city, country FROM Suppliers
WHERE Country='Germany'
ORDER BY City;
