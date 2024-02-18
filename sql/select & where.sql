--SELECT ----
--ALEX SELECT STATEMENT
--=,<>, <, >, AND, OR, LIKE, NULL, NOT NULL, IN
SELECT*
FROM EmployeeDemographics
WHERE Firstname = 'Jim'
WHERE Firstname <> 'Jim' --(doest equel)

SELECT*
FROM EmployeeDemographics
WHERE Age > 30 (>=30)(<=32)
WHERE AGE <=32 AND GENDER = 'Male'
WHERE Age > 32 OR  GENDER = 'Male'
-- Ühele kui ka teisele kriteeeriumile vastavad
--Otsingus ka kõik mistahes vanuses 'Male'-d--

SELECT*
FROM EmployeeDemographics
WHERE LastName LIKE 'S%'
--wild cardi kasutamine lõpus - ainult S alagavad nimed--
-- wild cardi kasutamine alguses ja lõpus -'S'kusiganes nime osas--
SELECT*
FROM EmployeeDemographics
WHERE LastName LIKE '%S%'
-- wild cardi kasutamine: S algab aga 'O' on ka kusagil
SELECT*
FROM EmployeeDemographics
WHERE LastName LIKE 'S%o%'

SELECT*
FROM EmployeeDemographics
WHERE LastName LIKE 'S%ott%'

-- Otsitakse konkreetset nime 'Scott'
SELECT*
FROM EmployeeDemographics
WHERE LastName LIKE 'S%c%ott%'

--NULL ja NOT NULL (kuvab kõik sest on kõik andmed olemas)--
SELECT*
FROM EmployeeDemographics
WHERE FirstName is NOT null
--- IN kasutakse ka = asemel, kui otsitakse mitut nime näiteks ja
-- ei taheta selle kohta teha mitut päringut vaid soovitalse, et
-- ühel lehel korraga kuvatakse --
SELECT*
FROM EmployeeDemographics
WHERE FirstName IN ('Jim', 'Michael')



--* TOP, DISTINCT, COUNT, AS, MAX, MIN, AVG --
SELECT *
FROM EmployeeDemographics

SELECT FirstName, LastName
FROM EmployeeDemographics

SELECT TOP 5 *
FROM EmployeeDemographics

SELECT *
FROM EmployeeDemographics

SELECT DISTINCT(EmployeeID)
FROM EmployeeDemographics

SELECT * COUNT(LastName)AS LastNameCOUNT
FROM EmployeeDemographics

SELECT MAX(Salary)
FROM EmployeeSalary

SELECT MIN(Salary)
FROM EmployeeSalary

SELECT AVG(Salary)
FROM EmployeeSalary

--SQL On võimalik valida, kas võtame andmed teatud
--tabelist, mille nime teame v kui aknas on *master* db siis
-- paneme tabelisse õige nime ja saame vastava pärigu vaste--
SELECT *
FROM SQL Tutorial.dbo.EmployeeSalary


--II Nov kursus veebist --

--Reeglina esimeseasjana sooviks teada saada mitu tulpa tabelis üldse on?-
--ChatGPT järgi päring: ---
SELECT COUNT(*)


--A) kõïk andmed mingist tabelist --
SELECT *
FROM table name;
--B) teatud tulp või tulbad --
SELECT column1, column2
FROM table name;
--C) Aggregate function + SELECT: COUNT, MAX, MIN, SUM, AVG +AS nimi veerule
--SQL also supports the use of aggregate expressions (or functions) that
--allow you to summarize information about a group of rows of data.

SELECT Col_name (s), aggregate_function (col_name) AS Col_name

SELECT salesperson, COUNT(order_number) AS order_count or COUNT (*)

SELECT salesperson, SUM(sale_amount) AS total_sales --liidab terve tabeli
--osas kokku kogu tabel COUNT*SUM
SELECT salesperson, COUNT(order_number) AS order_count, SUM(sale_amount) AS total_sales

SELECT title, rating * 10 AS rating_percent (--rating oli eelnevalt 8.2 süsteemis)

--D) 1x kirjed loetelus: SELECT DISTINCT --
SELECT DISTINCT director
FROM movies
ORDER BY director ASC;

--ORDER BY & LIMIT --
--- ORDER BY kasutamine --
-- Võimaldab andmed reastada 1 v enama tulba järgi ---
-- võimaldab valida kasvavat v kahanevat suunda: ASC,DESC --

-- 1. Ühe tulba järgi reastamine, ASC on default reeglina ----
SELECT *
FROM employees
ORDER BY last_name;

--- 2. Mitme tulba järgi reastamine ---
SELECT *
FROM employees
ORDER BY last_name DESC, first_name ASC;
-------------------------
LIMIT kasutamine --
---- A: LIMIT (number of rows -> )number
--- AB sõltuvalt on kasutusel ka : TOP, FETCH ... ONLY (eriti teistmoodi)---
SELECT *
FROM employees
LIMIT 5 [num_limit];

---LIMIT w OFFSET (e alustab alates 11.reast e skipib esimesed 10) ---
SELECT *
FROM employees
LIMIT 5 OFFSET 10 [num_offset]; (loetakse pärast 10-ndat 5 tk kuvatakse e- 11-15)




-- WHERE cluase kasutamine: OPERATORS--
WHERE = condition [N: age=18] column_name = x
WHERE != [not equal N: age !=18]
WHERE <> [not equal N: age<18>]
WHERE < [less than]
WHERE > [greater than]
WHERE <= [less than or equal to]
WHERE >= [greater than or equal to]
WHERE col_name LIKE ""
WHERE col_name NOT LIKE ""
WHERE col_name LIKE '%...%', '....%', '%....'
WHERE col_name IN ('A', 'B', 'C') N: WHERE employee_id IN (1,2,3,4,5)
WHERE col_name NOT IN
WHERE Col_name BETWEEN ...AND ... N: WHERE col_name BETWEEN 1.5 AND 10.5
WHERE Col_name BETWEEN ...AND ... N: WHERE oder_date BETWEEN '2022-01-01' AND '12022-03-31'
WHERE col_name NOT BETWEEN ..AND
WHERE col_name IS NULL/ IS NOT NULL; N: WHERE address IS NULL; (nullväärtuse testimine)
WHERE EXISTS .. (näide all)
WHERE col_name > ANY (näide all)
WHERE col_name > ALL (näide all)
WHERE SIMILAR TO '(A|B)%'/REGEXP '(A|B)'; (näide all)
WHERE condition AND/OR (näited all)
WHERE year % 2 matemaatiline tehe nim jagamis jääk


--NÄITED---

WHERE EXISTS
--WHERE col_name EXISTS samast tabelist--
-- kasutatakse testimaks mistahes andmerea olemasolu päringus. Con 'true'- kui rida tekib-
 SELECT*
 FROM CUSTOMERS
 WHERE EXISTS (
    SELECT 1 FROM ORDERS
    WHERE orders.customer_id = customers.customer_id);

--WHERE col_name EXISTS ERINEVATEST tabelitest
--Näide: tahame teada saada, kas on tudengeid, kes on kirja pannud mata kursusele--
SELECT student_name
FROM Students
WHERE EXISTS (
   SELECT *
   FROM course_enrollment
   WHERE student.student.id = course_enrollment.student_id
   AND course_name = 'Mathematics'

WHERE ANY
-- ANY ja WHERE -> sõelumaks välja, kas mõni väärtus on suurem kui teatud ajal--
SELECT *
FROM sales
WHERE amount > ANY (
  SELECT amount FROM sales
  WHERE sale_date ='2022-01-01'
);

--- WHERE ALL näide ---
--- This query will retrieve rows from sales where the amount is greater
-- than all the amounts from the sales made on "2022-01-01"--

SELECT*
FROM sales
WHERE amount > ALL (
   SELECT amount FROM sales
   WHERE sale_date = '2022-01-01'



---- mitme tingimuse seadmine ---
WHERE condition
  AND/OR another_condition
  AND/OR another_condition;

--NÄIDE__
SELECT COLUMN1, COLUMN2, SUM(SAle_amount) AS total sales
FROM sales
GROUP BY city, sale_date

-- Näide --
-- Basic --
SELECT name, address
FROM hco_license_residence
WHERE hco_license_residence.hco_license_id = hco_license_id;
