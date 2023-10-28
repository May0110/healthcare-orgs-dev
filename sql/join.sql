----endod nimed ja eriala JOIN ---
SELECT emp_pro.hco_profession_id, emp.surname, pro.name
FROM hco_employee_profession emp_pro
INNER JOIN hco_employee emp ON emp_pro.hco_employee_id = emp.id
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

  ---OUTER JOIN
  SELECT emp.firstname, emp.surname, hco.name
  FROM hco_employee emp
  OUTER JOIN hco_healthcare_organisation hco ON emp.hco_ID = hco.ID;
  
