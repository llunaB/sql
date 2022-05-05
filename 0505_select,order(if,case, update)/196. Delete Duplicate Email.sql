delete p1 from person p1, person p2
where p1.email = p2.email and p1.id > p2.id
---------------------------------------------

--?
--DELETE FROM Person
--WHERE Id NOT IN (
--  SELECT * FROM (
--    SELECT Min(Id)
--    FROM Person
--    GROUP BY Email
--  ) Tmp
--)

DELETE P1
FROM PERSON P1, PERSON P2
WHERE P1.EMAIL=P2.EMAIL AND P1.ID>P2.ID;