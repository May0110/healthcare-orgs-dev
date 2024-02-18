--1.
/*SELECT*
FROM hco_employee*/

--2. päring --

/*SELECT firstname, CODE AS nimi
FROM hco_employee
ORDER BY FirstName*/

--3. päring VIGANE
/*SELECT *
FROM hco_employee
ORDER BY surname
Limit 10;*/





--uus DIstinct--

/*SELECT DISTINCT surname
FROM hco_employee
ORDER BY surname;*/
-- MITU KIRJET on tabelis = 968--
/*SELECT COUNT (*)
FROM hco_employee;*/

-- mitu peprenime --
/*SELECT COUNT(*) surname
FROM hco_employee;*/
-- CH version ja tulemuseks oli arv 386 unikaalset nime --
/*SELECT COUNT(DISTINCT surname) FROM hco_employee;*/

-- GROUP BY perenimede puhul - tulemus kõik perenimed ka
-- korduvalt üksteise järel--
/*SElect surname
FROM hco_employee
ORDER BY surname;*/

-- Alexi järgi: mitu
/*SELECT SURNAME, COUNT(SURNAME)
FROM hco_employee
ORDER BY surname;*/

-- töötas : CHGPT ettepanek - nimi 1x ja arv taga--
/*SELECT SURNAME, COUNT(SURNAME)
FROM hco_employee
GROUP BY SURNAME
ORDER BY SURNAME;*/

--Kõige sagedas - vähemesinevanani-
/*SELECT SURNAME, COUNT(SURNAME)
FROM hco_employee
GROUP BY SURNAME
ORDER BY COUNT Desc;*/
--- eesnime ja perenime kattuvus - tulemus kahtlane --
/*SELECT firstname,SURNAME, COUNT(SURNAME)
FROM hco_employee
GROUP BY firstname, SURNAME
ORDER BY COUNT Desc;*/

--- Chat GPT versioon--
/*SELECT firstname, surname, COUNT(*)
FROM hco_employee
GROUP BY firstname, surname
ORDER BY firstname DESC, surname DESC;*/
--
/*SELECT firstname,SURNAME, COUNT(SURNAME)
FROM hco_employee
GROUP BY firstname, SURNAME
ORDER BY COUNT Desc;
-- Minu vigane .. annab tabeli aga mitte sobiva --
/*SELECT firstname,SURNAME, COUNT(SURNAME)
FROM hco_employee
GROUP BY firstname, SURNAME
ORDER BY firstname Desc, COUNT Desc;*/

--ChatGPT--
SELECT firstname, SURNAME, COUNT(SURNAME) AS surname_count
FROM hco_employee
GROUP BY firstname, SURNAME
ORDER BY firstname DESC, surname_count DESC;
