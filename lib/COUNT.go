--all rows--
SELECT COUNT(*) FROM table_name;

--Non NULL values IN specific column
SELECT COUNT(column_name) FROM table_name;

-- specific condition. Condition = Comaprison Operators (ch WHERE clause)--
SELECT COUNT(*) FROM table_name WHERE condition;

--Unique ehk non-repeated values in specific column--
SELECT COUNT(DISTINCT column_name) FROM table_name;

--Grouped Count (w GROUP BY)
SELECT column_name, COUNT(*)
FROM table_name
GROUP BY column_name;
