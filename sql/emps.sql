select e.firstname, e.surname, o.name, o.address
from hco_employee e, hco_healthcare_organisation o
where e.hco_id = o.id
order by e.surname ASC
