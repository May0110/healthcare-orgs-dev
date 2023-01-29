select count(*) from hco_healthcare_organisation;
select count(*) from hco_employee;

select e.firstname, e.surname, o.name, o.address 
from hco_employee e, hco_healthcare_organisation o
where e.hco_id = o.id;
