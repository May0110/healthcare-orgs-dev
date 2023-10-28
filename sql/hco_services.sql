SELECT lic.id, address
FROM hco_license_residence licres
INNER JOIN hco_license lic ON licres.hco_license_id = lic_id;
/*

1) organisatsioonide tegevuskohad
SELECT lic.id, address
FROM hco_license_residence lic res
INNER JOIN hco_license lic ON lic res.hco_license_id = lic_id;
2) organisatsioonide teenused eri tegevuskohtades

-- andmete olemasolu kontroll --
select *
from hco_license
where
  date_started IS NOT NULL
  OR date_ended IS NOT NULL;

--Timestamp väljenduse kriteeriumid--
SELECT *
FROM hco_license
WHERE
  date_started > to_timestamp('01.01.1975 12:30:00', 'DD.MM.YYYY HH24:MI:SS')
  AND date_started < to_timestamp('01.01.2023 15:45:00', 'DD.

----Load ajavahemikul ---
SELECT *
FROM hco_license
WHERE date_started BETWEEN '01.01.1975' AND '01.01.2005';

-- Ainult id numbrid --
SELECT *
FROM hco_license_residence_service
order by hco_service_id ASC;

-- Terve hco_service tabeli kirjed --
SELECT * FROM hco_service
order by name ASC;
--
SELECT code, lower(NAME)
from hco_service
order by lower(name) ASC;

-- HCO nimi + litsensid ---
-- HCO nimi + litsensid + COUNT - hcol palju lintsentse?---
SELECT COUNT(*) FROM hco_license;
-- HCO nimi + litsensid + WHERE - millistel hcol konkreetseid n: 2 litsentsi on või enam kui 2 litsentsi?---
-- HCO ja mis aadressidel tegutseb
-- HCO ja

*/
