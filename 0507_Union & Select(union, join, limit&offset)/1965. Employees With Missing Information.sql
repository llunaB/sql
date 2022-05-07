select T.employee_id
from
(
select employee_id, name, salary from employees left join salaries
using (employee_id)
union
select employee_id, name, salary from employees right join salaries
using (employee_id)
) as T
where T.salary is null or T.name is null
order by employee_id



-----------------------------------

SELECT T.employee_id
FROM
  (SELECT * FROM Employees LEFT JOIN Salaries USING(employee_id)
   UNION
   SELECT * FROM Employees RIGHT JOIN Salaries USING(employee_id))
AS T
WHERE T.salary IS NULL OR T.name IS NULL
ORDER BY employee_id;