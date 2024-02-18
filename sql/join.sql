--JOIN puhul räägime me andmete normaliseerimisest. OUTER joini kasutamine
--kui tabelites on asümmeerilised andmed:
-- LEFT JOIN: on kindel, et andmerida on täiuslik tabelis A, aga B tulbas on puudu
-- RIGHT JOIN - vastupidi
-- FULL JOIN kummagis tabelis ei pruugi olla kattuvust

--ALEX JA JOIN 1. Intermediate
--Inner Joins, Full, left, outer joins --
-- Mõlemas tabelis on kattuv tulp - Employee ID --
--Esmalt teeme INNER JOIN -> !!selle tulemusel tullevad üle vaid need väärtused,
--töötajad ja palgad, kelle andmereas ei esine ühtegi tühja välja ---
SELECT *
FROM SQLTutorial.dbo.EmployeeDemographics
Inner JOIN SQLTutorial.dbo.EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

--Toob välja NULL Väljad Näitab ka siis kui ühes tabelis --
-- on Employee ID puudu--
SELECT *
FROM SQLTutorial.dbo.EmployeeDemographics
FULL OUTER JOIN SQLTutorial.dbo.EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

-- Left OUTER JOIN võtab kõige vasakust tabelist Emp Dem võetakse kõik ja
--0 infot võib olla NULL andmed --
SELECT *
FROM SQLTutorial.dbo.EmployeeDemographics
Left OUTER JOIN SQLTutorial.dbo.EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

--Right OUTER JOINI puhul on kõik andmed parema tabeli kohta,
--ka kui seal on employee ID NULL - ja vastas siis vastavad vasaku
--tabeli andmed --Poo

SELECT *
FROM SQLTutorial.dbo.EmployeeDemographics
Right OUTER JOIN SQLTutorial.dbo.EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID*/

--Oma andmestikuga 1. katse kus 2 tabelit on seotud
SELECT *
FROM hco_employee emp
FULL OUTER JOIN hco_profession pro
ON emp.hco_id = pro.id

--Siin kuvab kõik read, kus andmed on kõik olemas erinevalt
--FULL OUTER JOINist--


SELECT *
FROM hco_employee emp
INNER JOIN hco_profession pro
ON emp.hco_id = pro.id

SELECT *
FROM hco_employee emp
Left OUTER JOIN hco_profession pro
ON emp.hco_id = pro.id

SELECT *
FROM hco_employee emp
Right outer JOIN hco_profession pro
ON emp.hco_id = pro.id

-- Keerulisemad õi õigemini detailsemad käsud --
-- 1st hco_employee firstname, surname, code [hco_id ka on ok]
--2-st hco_profession name
-- küsimus, et kui annan lühendi rida allpool kas see siis töötab?--
SELECT * emp.firstname, emp.surname, pro.name
FROM hco_employee emp
FULL OUTER JOIN hco_profession pro
ON emp.hco_id = pro.id
--kirjutan siia ka igaks juhuks pika versiooni--
SELECT * hco_employee.firstname, hco_employee.surname, hco_profession.name
FROM hco_employee emp
FULL OUTER JOIN hco_profession pro
ON emp.hco_id = pro.id

SELECT *
FROM hco_employee emp
INNER JOIN hco_profession pro
ON emp.hco_id = pro.id

SELECT *
FROM hco_employee emp
Left OUTER JOIN hco_profession pro
ON emp.hco_id = pro.id

FROM hco_employee emp
Right OUTER JOIN hco_profession pro
ON emp.hco_id = pro.id


/*----endod nimed ja eriala JOIN  emp_proja emp on lühendid---
SELECT emp_pro.hco_profession_id, emp.surname, pro.name
FROM hco_employee_profession emp_pro
INNER JOIN hco_employee emp
ON emp_pro.hco_employee_id = emp.id
INNER JOIN hco_profession pro ON emp_pro.hco_profession_id = pro.id;
----lisatingimuste, aliaste + normaalsed tulpade nimetused ja ilma ID-ta--

SELECT ser.name service_name, res.address residense_address
FROM hco_license_residence_service ls_pro
  INNER JOIN hco_license_residence res ON ls_pro.hco_license_residence_id = res.id
  INNER JOIN hco_service ser ON ls_pro.hco_service_id = ser.id
ORDER BY ser.name ASC;

--COUNT ja INNER JOIN--
SELECT count(*)
FROM hco_license_residence_service ls_pro
  INNER JOIN hco_license_residence res ON ls_pro.hco_license_residence_id = res.id
  INNER JOIN hco_service ser ON ls_pro.hco_service_id = ser.id;

  ---OUTER JOIN - see peaks töötama
  SELECT emp.firstname, emp.surname, hco.name
  FROM hco_employee emp
  OUTER JOIN hco_healthcare_organisation hco ON emp.hco_ID = hco.ID;

  ---FULL OUTER JOIN ---
  -- FULL OUTER JOIN + asutuse litsentsid kokku litsentsi tüüpide järgi
  SELECT lic.license_type_name Litsents, hco.name Asutus, res.Address Aadress
  FROM hco_license_residence_service liser
    FULL OUTER JOIN hco_license_residence res ON liser.hco_license_residence_id = res.id
    FULL OUTER JOIN hco_license lic ON res.hco_license_id = lic.id
    FULL OUTER JOIN hco_healthcare_organisation hco ON lic.hco_id = hco.id
  ORDER BY
    Aadress ASC;

    --Näiteid palju hco_licenses.sql JOINImine toimub 1. MASTER tabelist tahapoole--

    SELECT lic.license_type_name Litsents, hco.name Asutus, count(*) Hulk
    FROM hco_license_residence_service liser
      INNER JOIN hco_license_residence res ON liser.hco_license_residence_id = res.id
      INNER JOIN hco_license lic ON res.hco_license_id = lic.id
      INNER JOIN hco_healthcare_organisation hco ON lic.hco_id = hco.id
    WHERE
      lic.license_type_name = 'Kiirabi'
    GROUP BY
      Litsents, Asutus
    ORDER BY
      Hulk DESC;

      -- asutuste loetelu koos töötajate arvuga, järjestatud töötajate arvu järgi
      -- (suuremad enne). Filtreeritakse välja need kus on rohkem kui 10 töötajat.
      SELECT hco.name Asutus, count(*) Töötajaid
      FROM hco_employee emp
        INNER JOIN hco_healthcare_organisation hco ON emp.hco_ID = hco.ID
      GROUP BY
        hco.name
      HAVING
        count(*) > 10
      ORDER BY
        count(*) DESC;

  -----
  --Find the total number of years employed by all Engineers
  SELECT role, SUM(years_employed)
  FROM employees
  GROUP BY role
  HAVING role = "Engineer";
