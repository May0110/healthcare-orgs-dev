---kirurgia
SELECT * FROM hco_service
where name LIKE ('%kirurgia%')
order by name ASC;

/*
SELECT *
FROM hco_service
order by name ASC;
---kirurgia
SELECT * FROM hco_service
where name LIKE ('%kirurgia%')
order by name ASC;
---%
SELECT * FROM hco_service
where name LIKE ('kirurgia%')
order by name ASC;
---code
SELECT * FROM hco_service
where name LIKE ('%ortopeedia%')
order by code ASC;
--konkreetset datat
SELECT name
FROM hco_service
order by name ASC;
--column  VIGANE
SELECT column1, column2
FROM hco_service;

SELECT * From hco_service
order by name asc;
*/
