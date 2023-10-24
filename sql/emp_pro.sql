SELECT emp_pro.hco_profession_id, emp.surname, pro.name
FROM hco_employee_profession emp_pro
INNER JOIN hco_employee emp ON emp_pro.hco_employee_id = emp.id
INNER JOIN hco_profession pro ON emp_pro.hco_profession_id = pro.id;



q
/*
SELECT * FROM hco_profession
WHERE name LIKE select
where name LIKE ('%pediaatria%')
order by name ASC;

-----JOIN_-
SELECT emp_pro.hco_profession_id, emp.surname
FROM hco_employee_profession emp_pro
INNER JOIN hco_employee emp ON emp_pro.hco_employee_id = emp.id;

*/
