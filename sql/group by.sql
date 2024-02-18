--ALex materjal GROUP BY & ORDER BY*/--

-- DISTINCTI ERINEVUS GROUP BY-ST--
--TULEMUS NN VERY FIRST UNIQE VALUE IN THE TABLE--
--In this case MALE & FEMALE (kui palju mei eitea)

SELECT DISTINCT (GENDER)
FROM EmployeeDemographics

--GROUP BY puhul kuvab sama aga kui teha täpsustus
--päringusse, siis saame teada palju neid on --

SELECT Gender
FROM EmployeeDemographics
GROUP BY GENDER
---mitu kedagi siis nii--

SELECT Gender, COUNT (Gender)
FROM EmployeeDemographics
GROUP BY GENDER
--2 tegurit --
Select Gender, Age, COUNT (Gender)
FROM EmployeeDemographics
GROUP BY GENDER, Age
--- 3 teguritb
SELECT Gender, COUNT (Gender)
FROM EmployeeDemographics
Where Age > 31
GROUP BY GENDER
--tulba nimetuse andmine AS uus_nimi + ORDER BY lisamine --
SELECT Gender, COUNT (Gender)
FROM EmployeeDemographics
Where Age > 31
GROUP BY CountGender
--Proovida ASC kui Desc--

-- Sama aga GROUP BY reaastamine ORDER BY Gender alusel--
SELECT Gender, COUNT (Gender)
FROM EmployeeDemographics
Where Age > 31
GROUP BY GENDER
ORDER BY GENDER

-- ASC numbrite puhul on väiksemast suuremani
--kõik 5 tulpa kaasatud --
SELECT *
FROM EmployeeDemographics
ORDER BY Age /DESC
-- mitme tulba alusel sortimine + ASC v DESC kriteerium

SELECT *
FROM EmployeeDemographics
ORDER BY Age, Gender ( vanus ja siis esmalt Female ja Male)
--
SELECT *
FROM EmployeeDemographics
ORDER BY Age DESC, Gender DESC (ASC)

-- Väikesel tabelil EI pea kasutama tulpade nimesid vaid võib kasut ka nummerdust--
SELECT *
FROM EmployeeDemographics
ORDER BY 4 Desc, 5 DESC












--Varasem materhjal--
--1. GROUP BY BASIC kasutamine: arrange identical data into groups
--NB! AGGREGATE Function: COUNT(), MAX(),MIN(),SUM(); AVG()
SELECT column_name, COUNT (column_name) AS, SUM [aggregate _function (column_name)]
From table_name
GROUP BY column_name
Näide
SELECT salesperson, COUNT(order_number) AS order_count, SUM(sale_amount) AS total_sales
FROM sales
GROUP BY salesperson


---2.  GROUP BY mitme tulba osas ---
SELECT column1, column2, aggreagte _function (column3)
FROM table_name
GROUP BY column1, column2
Näide
SELECT city,sale_date, SUM(sale_amount) AS total sales
FROM sales
GROUP BY city,sale_date,

-- 3. GROUP BY HAVING CLAUSE ---
- 3.a asutuste loetelu koos töötajate arvuga, järjestatud töötajate arvu järgi
-- (suuremad enne). Filtreeritakse välja need kus on rohkem kui 10 töötajat.
-- NB! Kasutan order ja group by's aliaseid
SELECT hco.name Asutus, count(*) Töötajaid
FROM hco_employee emp
  INNER JOIN hco_healthcare_organisation hco ON emp.hco_ID = hco.ID
GROUP BY
  asutus
HAVING
  count(*) > 10
ORDER BY
  asutus ASC;
-- 3.b GROUP BY; HAVING SUM funktsioon --
SELECT column_name, agrregate_function (column_name)
FROM table_name
GROUP BY column_name
HAVING condition;
Näide:
SELECT salesperson, SUM(sales_amount) AS total_sales
FROM slaes
GROUP BY salesperson
HAVING SUM(sale_amount) > 1000;
Näide
SELECT COLUMN1, COLUMN2, SUM(SAle_amount) AS total sales
FROM sales
GROUP BY city, sale_date
