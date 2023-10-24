-- kõik erialad
select * from hco_profession
LIMIT 10;

/*

--vigane käsk:
select column2 From hco_profession;

kõik erialad
select * from hco_profession
order by name ASC;


SELECT * FROM
-- pediaatria erialad
select * from hco_profession
where name LIKE ('%pediaatria%')
order by name ASC;
--DISTINCT=different
select DISTINCT NAME from hco_profession
order by name ASC;
----MIS ON erinevus - ei ole erinevust DISTINCTIGA
select NAME from hco_profession
order by name ASC;
---Where =
SELECT * from hco_profession
where name='kirurg';
----
SELECT * from hco_profession
where name='õendusabi';
---LIKE
SELECT * from hco_profession
where name LIKE ('õendusabi');
*/
