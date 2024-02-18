--- ORDER BY kasutamine --
-- Võimaldab andmed reastada 1 v enama tulba järgi ---
-- võimaldab valida kasvavat v kahanevat suunda: ASC,DESC --

-- Ühe tulba järgi reastamine, ASC on default reeglina ----
SELECT *
FROM employees
ORDER BY last_name;

--- Mitme tulba järgi reastamine ---
SELECT *
FROM employees
ORDER BY last_name DESC, first_name ASC;

----LIMIT kasutamine --
---- A: LIMIT (number of rows -> )number
--- AB sõltuvalt on kasutusel ka : TOP, FETCH ... ONLY (eriti teistmoodi)
--TOP on kasutusel MySQL päring on siis:
SELECT *
FROM employees
LIMIT 5;

---LIMIT w OFFSET (e alustab alates 11.reast e skipib esimesed 10) ---
SELECT *
FROM employees
LIMIT 5 OFFSET 10;
