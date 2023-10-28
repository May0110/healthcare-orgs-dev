SELECT count(*)
FROM hco_license_residence_service ls_pro
  INNER JOIN hco_license_residence res ON ls_pro.hco_license_residence_id = res.id
  INNER JOIN hco_service ser ON ls_pro.hco_service_id = ser.id;

/*
--COUNT kasutamine INNER JOINi puhul--
SELECT count(*)
FROM hco_license_residence_service ls_pro
  INNER JOIN hco_license_residence res ON ls_pro.hco_license_residence_id = res.id
  INNER JOIN hco_service ser ON ls_pro.hco_service_id = ser.id;

  --ORDER BY ja INNER JOIN
SELECT ser.name service_name, res.address residense_address
FROM hco_license_residence_service ls_pro
  INNER JOIN hco_license_residence res ON ls_pro.hco_license_residence_id = res.id
  INNER JOIN hco_service ser ON ls_pro.hco_service_id = ser.id
ORDER BY ser.name ASC;

--INNER JOIN näidis---
SELECT emp_pro.hco_profession_id, emp.surname, pro.name
FROM hco_employee_profession emp_pro
INNER JOIN hco_employee emp ON emp_pro.hco_employee_id = emp.id
INNER JOIN hco_profession pro ON emp_pro.hco_profession_id = pro.id;

--SELECT & WHERE KASUTAMINE erineval viisil--
SELECT * FROM hco_license
ORDER by license_type_name ASC;

SELECT * FROM hco_license
where code LIKE ('%L05%')
ORDER by code ASC;

--valesti 2 tingimuse ASC - koma puudu ja 2x ORDER by:
SELECT * FROM hco_license
where code LIKE ('%L05%')
ORDER by code ASC
ORDER by license_type_name ASC;

--õieti 2 tingimuse asc
SELECT * FROM hco_license
where code LIKE ('%L05%')
ORDER by code ASC,
license_type_name ASC;

-- 04, 05, 06 algusega testimine -palju on
SELECT * FROM hco_license
where code LIKE ('L04%')
Order by license_type_name ASC;

---vigane 2x LIKE tingimust: vaja kasutada OR ja 2. like
SELECT * FROM hco_license
where code LIKE ('L04%'),('%Õendusabi%');

---vale 2. c  nimi
SELECT * FROM hco_license
WHERE (code LIKE 'L04%' OR code LIKE '%Õendusabi%');

-- õige c name 2. tingimuse puhul
SELECT * FROM hco_license
WHERE code LIKE ('%L04%') OR license_type_name LIKE ('Õendus%');

--IN vale kasutada
SELECT * FROM hco_license
WHERE code LIKE ('%L04%') IN license_type_name ('Õendusabi');
--Õige päring
SELECT * FROM hco_license
WHERE code LIKE '%L04%' AND license_type_name = 'Õendusabi';

--COUNT KASUTAMINE erineval viisil--

--all rows - 2638 1 row: COUNT
ELECT COUNT(*) FROM hco_license;

--Non-NULL value tagaajamiseks aga siin välja ei tule: COUNT c_n FROM
SELECT COUNT(license_type_name) FROM hco_license;

--VIGANE !!! aga RK. Specific Match Condition: COUNT _FROM t_n WHERE cond = comparison operators
SELECT COUNT(*) FROM hco_license WHERE code = L05;

__ UNIQUE values = Erinevate karakteristikute hulga  päring tabelist--
SELECT COUNT(DISTINCT license_type_name) FROM hco_license;
--Siin oli vastus 5--





*/
