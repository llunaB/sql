-------------------------------------------------------
-------------------------------------------------------
--update
UPDATE table_name
SET column1 = value1, column2 = value2, ...
WHERE condition;
-------------------------------------------------------
-------------------------------------------------------

UPDATE salary SET sex = IF(sex='m','f','m');
update salary set sex = CHAR(ASCII('f') ^ ASCII('m') ^ ASCII(sex));
