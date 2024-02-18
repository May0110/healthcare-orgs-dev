--Kui palju tulpasid tabelis on? EI OSKA--
SELECT COUNT(*)
FROM information_schema.column
WHERE table_schema = 'your schema' default  is 'public'
AND table_name = big_cities_health_data_inventory;

--Palju ridasid DB?
SELECT COUNT(*)
FROM big_cities_health_data_inventory;

--milliseid erinevaid kirjeid on DB tulpades --
-- 11 erinevat I_C-s
SELECT DISTINCT indicator_category
FROM big_cities_health_data_inventory
ORDER BY indicator_category ASC;

-- place: 29--
SELECT DISTINCT place
FROM big_cities_health_data_inventory
ORDER BY place ASC;

--race_ethnicity: 9--
SELECT DISTINCT race_ethnicity
FROM big_cities_health_data_inventory
ORDER BY race_ethnicity ASC;

II Kui palju on mingit kirjet tulbas
