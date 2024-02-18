-- asutuste loetelu koos töötajate arvuga, järjestatud töötajate arvu järgi
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

/*

-- asutuste loetelu koos töötajate arvuga, järjestatud töötajate arvu järgi
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

-- asutuste loetelu koos töötajate arvuga, järjestatud töötajate arvu järgi (suuremad enne)
SELECT hco.name Asutus, count(*) Töötajaid
FROM hco_employee emp
  INNER JOIN hco_healthcare_organisation hco ON emp.hco_ID = hco.ID
GROUP BY
  hco.name
ORDER BY
  count(*) DESC

-- asutuste loetelu koos töötajate arvuga, järjestatud asutuse nime järgi
SELECT hco.name Asutus, count(*) Töötajaid
FROM hco_employee emp
  INNER JOIN hco_healthcare_organisation hco ON emp.hco_ID = hco.ID
GROUP BY
  hco.name
ORDER BY
  hco.name ASC;

-- töötajad ja nende asutused
SELECT emp.firstname Eesnimi, emp.surname Perenimi, hco.name Asutus
FROM hco_employee emp
  INNER JOIN hco_healthcare_organisation hco ON emp.hco_ID = hco.ID;

-- töötajad koos organisatsioonide ja eridaladega
SELECT
  emp.surname eesnimi, pro.name eriala, hco.name organisatsioon,
  lic.license_type_name Litsents
FROM hco_employee_profession emp_pro, hco_license
  INNER JOIN hco_employee emp ON emp_pro.hco_employee_id = emp.id
  INNER JOIN hco_profession pro ON emp_pro.hco_profession_id = pro.id
  INNER JOIN hco_healthcare_organisation hco ON emp.hco_id = hco.id
  INNER JOIN hco ON lic.hco_id = hco.id
WHERE
  hco.name LIKE 'A%';

SELECT emp.firstname Eesnimi, emp.surname Perenimi, hco.name Asutus
FROM hco_employee emp
  LEFT JOIN hco_healthcare_organisation hco ON emp.hco_ID = hco.ID;

---GROUP BY katsetus 1--

SELECT id, surname
FROM hco_employee

UNION ALL

SELECT id, name
FROM hco_healthcare_organisation;

--VIGANE Union--
SELECT
FROM hco_employee
UNION ALL
SELECT name
FROM hco_healthcare_organisation;
---VIGANE ---
SELECT emp.surname Perenimi, pro.name Eriala, hco.name Organisatsioon, lic.license_type_name Litsents
FROM hco_employee_profession emp_pro, hco_license
INNER JOIN hco_employee emp ON emp_pro.hco_employee_id = emp.id
INNER JOIN hco_profession pro ON emp_pro.hco_profession_id = pro.id
INNER JOIN hco_healthcare_organisation hco ON emp.hco_id = hco.id
INNER JOIN hco ON lic.hco_id = hco.id;
--ÕIGE
SELECT emp.firstname, emp.surname, hco.name
FROM hco_employee emp
OUTER JOIN hco_healthcare_organisation hco ON emp.hco_id = hco.id;

--VIGANE ---
SELECT emp.firstname, emp.surname, hco.name
FROM hco_employee emp
OUTER JOIN hco_healthcare_organisation hco ON emp.hco_id = hco.id;

----ÕIGE-----
SELECT emp.firstname, emp.surname, hco.name
FROM hco_employee emp
LEFT JOIN hco_healthcare_organisation hco ON emp.hco_id = hco.id;

---vigane 2---
SELECT  hco_healtcare_organisation.name, hco_employee.firstname, hco_employee.surname,
FROM hco_healtcare_organisation
RIGHT JOIN hco_employee ON hco_healtcare_organisation.hcoID = hco_employee.hcoID;


----vigane
SELECT emp.firstname, emp.surname, hco_healtcare_organisation.name
FROM hco_employee emp
LEFT JOIN hco_healtcare_organisation hco ON emp.empID = hco.empID;

---COUNT---
SELECT count(*)
FROM hco_employee_profession emp_pro
INNER JOIN hco_employee emp ON emp_pro.hco_employee_id = emp.id
INNER JOIN hco_profession pro ON emp_pro.hco_profession_id = pro.id;

---INNER JOIN---
SELECT emp_pro.hco_profession_id, emp.surname, pro.name
FROM hco_employee_profession emp_pro
INNER JOIN hco_employee emp ON emp_pro.hco_employee_id = emp.id
INNER JOIN hco_profession pro ON emp_pro.hco_profession_id = pro.id;

SELECT * FROM hco_profession
WHERE name LIKE select
where name LIKE ('%pediaatria%')
order by name ASC;

-----JOIN_-
SELECT emp_pro.hco_profession_id, emp.surname
FROM hco_employee_profession emp_pro
INNER JOIN hco_employee emp ON emp_pro.hco_employee_id = emp.id;
--DB viga ja kasutas set mydb-# set (hco_profession_id = 3;)
ELECT emp_pro.hco_profession_id, emp.surname, pro.name
FROM hco_employee_profession emp_pro
INNER JOIN hco_employee emp ON emp_pro.hco_employee_id = emp.id
INNER JOIN hco_profession pro ON emp_pro.hco_profession_id = pro.id;

*/
