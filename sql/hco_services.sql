
/*

1) organisatsioonide tegevuskohad
SELECT res.aadress, lic.hco_id
FROM hco_license_residence res
INNER JOIN hco_license lic ON res.lic_id = lic.id;

SELECT lic.id, , address
FROM hco_license_residence licres
INNER JOIN hco_license lic ON licres.hco_license_id = lic.id;
2) organisatsioonide teenused eri tegevuskohtades
SELECT ser.name teenus, res.address
FROM hco_license_residence_service liser
  INNER JOIN hco_service ser ON liser.hco_service_id = ser.id
  INNER JOIN hco_license_residence res ON liser.hco_license_residence_id = res.id;
--vale--
SELECT ser.name, liser.address
FROM hco_license_residence_service liser
INNER JOIN hco_service ser ON liser.hco_service.id = ser.id;


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
