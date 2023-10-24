SELECT code, initcap(name)
from hco_service
order by initcap(name) ASC;
/*
SELECT code, lower(NAME)
from hco_service
order by lower(name) ASC;

SELECT initcap('your string here');

SELECT code, upper(NAME)
from hco_service
order by upper(name) ASC;
*/
