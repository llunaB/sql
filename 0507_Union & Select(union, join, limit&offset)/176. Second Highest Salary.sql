-- 2번쨰로 높은 봉급, 없으면 null 반환
select
(
select distinct salary
from employee
order by salary desc
limit 1 offset 1
)
as SecondHighestSalary

--------------------------------------------
SELECT max(Salary) AS SecondHighestSalary
FROM Employee
WHERE Salary < (SELECT max(Salary) FROM Employee)


# Concise way to get the Nth highest by using LIMIT N-1
# Make a temporary table to account for NULL
SELECT (
    SELECT DISTINCT Salary
    FROM EMPLOYEE
    ORDER BY Salary DESC
    LIMIT 1 OFFSET 1
) AS SecondHighestSalary