select count(*) from hco_healthcare_organisation;
select count(*) from hco_employee;
select count(*) from hco_license;
select count(*) from hco_license_residence;
select count(*) from hco_license_residence_service;

select e.firstname, e.surname, o.name, o.address
from hco_employee e, hco_healthcare_organisation o
where e.hco_id = o.id;

SELECT * FROM pg_catalog.pg_tables
WHERE tablename LIKE 'hco%';
----hco_license VIGANE
SELECT distinct licence_type_name * FROM hco_license;
----
select COUNT(*) from hco_licence
----
select * from hco_licence
order by licence_type_name ASC;
