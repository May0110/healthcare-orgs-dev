-- FULL OUTER JOIN + asutuse litsentsid kokku litsentsi tüüpide järgi
SELECT lic.license_type_name Litsents, hco.name Asutus, res.Address Aadress
FROM hco_license_residence_service liser
  FULL OUTER JOIN hco_license_residence res ON liser.hco_license_residence_id = res.id
  FULL OUTER JOIN hco_license lic ON res.hco_license_id = lic.id
  FULL OUTER JOIN hco_healthcare_organisation hco ON lic.hco_id = hco.id
ORDER BY
  Aadress ASC;

/*
-- asutuse litsentsid kokku litsentsi tüüpide järgi
SELECT lic.license_type_name Litsents, hco.name Asutus, res.Address Aadress
FROM hco_license_residence_service liser
  INNER JOIN hco_license_residence res ON liser.hco_license_residence_id = res.id
  INNER JOIN hco_license lic ON res.hco_license_id = lic.id
  INNER JOIN hco_healthcare_organisation hco ON lic.hco_id = hco.id
WHERE
  hco.name = 'Sihtasutus Tartu Kiirabi'
ORDER BY
  Aadress ASC;

-- asutuse litsentsid kokku litsentsi tüüpide järgi
SELECT lic.license_type_name Litsents, hco.name Asutus, count(*) Hulk
FROM hco_license_residence_service liser
  INNER JOIN hco_license_residence res ON liser.hco_license_residence_id = res.id
  INNER JOIN hco_license lic ON res.hco_license_id = lic.id
  INNER JOIN hco_healthcare_organisation hco ON lic.hco_id = hco.id
WHERE
  lic.license_type_name = 'Kiirabi'
GROUP BY
  Litsents, Asutus
ORDER BY
  Hulk DESC;

-- litsentsi tüüpide hulk
SELECT lic.license_type_name, count(*) Hulk
FROM hco_license_residence_service liser
  INNER JOIN hco_license_residence res ON liser.hco_license_residence_id = res.id
  INNER JOIN hco_license lic ON res.hco_license_id = lic.id
  INNER JOIN hco_healthcare_organisation hco ON lic.hco_id = hco.id
GROUP BY
  lic.license_type_name
ORDER BY
  Hulk DESC;

-- asutuse litsentsid kokku litsentsi tüüpide järgi
SELECT lic.license_type_name Litsents, hco.name Asutus, count(*) Hulk
FROM hco_license_residence_service liser
  INNER JOIN hco_license_residence res ON liser.hco_license_residence_id = res.id
  INNER JOIN hco_license lic ON res.hco_license_id = lic.id
  INNER JOIN hco_healthcare_organisation hco ON lic.hco_id = hco.id
GROUP BY
  Litsents, Asutus
ORDER BY
  Asutus ASC;

---sellega tuli tabel aga type on vaid eriarstiabi--
SELECT lic.license_type_name, hco.name
FROM hco_license_residence_service liser
  INNER JOIN hco_license_residence res ON liser.hco_license_residence_id = res.id
  INNER JOIN hco_license lic ON res.hco_license_id = lic.id
  INNER JOIN hco_healthcare_organisation hco ON lic.hco_id = hco.id
GROUP BY
  lic.license_type_name, hco.name
ORDER BY
  lic.license_type_name ASC;

---Vigane: hco.name peab minema GROUP BY???--

SELECT lic.license_type_name, hco.name
FROM hco_license_residence_service liser
  INNER JOIN hco_license_residence res ON liser.hco_license_residence_id = res.id
  INNER JOIN hco_license lic ON res.hco_license_id = lic.id
  INNER JOIN hco_healthcare_organisation hco ON lic.hco_id = hco.id
GROUP BY
  lic.license_type_name
ORDER BY
  lic.license_type_name ASC;


1)
SELECT hco.name, res.address
FROM hco_license_residence res
  INNER JOIN hco_license lic ON res.hco_license_id = lic.id
  INNER JOIN hco_healthcare_organisation hco ON lic.hco_id = hco.id;

  --õige--
  SELECT hco.name, res.address, res.hco_license_id
  FROM hco_license_residence res
    INNER JOIN hco_license lic ON res.hco_license_id = lic.id
    INNER JOIN hco_healthcare_organisation hco ON lic.hco_id = hco.id;

2) organisatsioonide teenused eri tegevuskohtades
SELECT hco.name organisatsioon, ser.name teenus, res.address aadress
FROM hco_license_residence_service liser
  INNER JOIN hco_service ser ON liser.hco_service_id = ser.id
  INNER JOIN hco_license_residence res ON liser.hco_license_residence_id = res.id
  INNER JOIN hco_license lic ON res.hco_license_id = lic.id
  INNER JOIN hco_healthcare_organisation hco ON lic.hco_id = hco.id;

3) esimene group by

kuva ettevõtte litsentside loetelu ning selle taga "count" et mitmes kohas
(residence) selle litsentsi all teenust pakutakse
  hint : selleks pead hco_license_residence grupeerime hco_license_id järgi

  SELECT lic.license_type_name, hco.name
  FROM hco_license_residence_service liser
    INNER JOIN INNER JOIN hco_license_residence res ON liser.hco_license_residence_id = res.id
    INNER JOIN hco_license lic ON res.hco_license_id = lic.id
    INNER JOIN hco_healthcare_organisation hco ON lic.hco_id = hco.id;
  GROUP BY
    lic.license_type_name
  ORDER BY
    lic.license_type_name ASC;

*/
