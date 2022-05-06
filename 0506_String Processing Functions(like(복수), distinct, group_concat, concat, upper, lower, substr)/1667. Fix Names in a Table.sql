--UPPER(A) where A is string
--LOWER(A) where A is string
--SUBSTR(A,index,length) where A is string index is starting index(1 index insead of 0 index) and length which is optional
--So to get first letter we can use SUBSTR(name,1,1)
--To get the remaining string we can use SUBSTR(name,2) // length is not required here
--CONCAT(A,B) where we concat two strings A+B


select user_id, concat(upper(substr(name, 1, 1)), lower(substr(name, 2))) as name
from users
order by user_id

-----------------------------------------------------------------------------
SELECT Users.user_id , CONCAT(UPPER(SUBSTR(Users.name,1,1)),LOWER(SUBSTR(Users.name,2)))
AS name
FROM Users
ORDER BY Users.user_id ASC