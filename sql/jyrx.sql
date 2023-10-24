SELECT count(*)
FROM hco_employee_profession emp_pro
  INNER JOIN hco_employee emp ON emp_pro.hco_employee_id = emp.id
  INNER JOIN hco_profession pro ON emp_pro.hco_profession_id = pro.id;

/*

SELECT count(*)
FROM hco_license_residence_service ls_pro
  INNER JOIN hco_license_residence res ON ls_pro.hco_license_residence_id = res.id
  INNER JOIN hco_service ser ON ls_pro.hco_service_id = ser.id;

SELECT emp_pro.hco_profession_id, emp.surname, pro.name
FROM hco_employee_profession emp_pro
  INNER JOIN hco_employee emp ON emp_pro.hco_employee_id = emp.id
  INNER JOIN hco_profession pro ON emp_pro.hco_profession_id = pro.id;

*/