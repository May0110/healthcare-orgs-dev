select e.firstname, e.surname, o.name, o.address
from hco_employee e, hco_healthcare_organisation o
where e.hco_id = o.id
order by e.surname ASC;

-- where and and ok
SELECT * FROM hco_employee
WHERE firstname = 'Janika' AND surname = 'Palksaar';
--- where and and 2 ei
select * from hco_employee
where surname = 'Vahtarorg' AND address   = 'Valga maakond';
-- x ei
select * from hco_employee
where surname = 'Vahtraorg';
--y ok
select * from hco_employee
where surname='Vahtraorg';
-- LIKE %
select * from hco_employee
where surname LIKE 'K%';
-- LIKE asc EI -> sest ORDER BY
select * from hco_employee
where surname LIKE 'K%', surname ASC;
--- like +  ASC OK
select * from hco_employee
where surname LIKE 'K%'
Order By surname ASC;
-- like + 2x ASC EI teinud
select * from hco_employee
where surname LIKE 'K%'
Order By surname ASC; id ASC;
-- AND code nr EI sest koodi N14000 ei exixti
select * from hco_employee
WHERE surname LIKE 'K%'
AND code > N14000;
--- AND code nr Ei saa ka ... kas siis ei saagi?

select * from hco_employee
WHERE surname LIKE 'K%'
AND code > 14000;
-- And ja or
select * from hco_employee
