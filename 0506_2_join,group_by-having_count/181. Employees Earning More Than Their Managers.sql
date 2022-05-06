select e1.name as Employee
from employee e1, employee e2
where e1.managerId is not null and
e1.managerId = e2.id and e1.salary > e2.salary



-----------------------------------------------
select name as Employee from Employee E1
where salary > (
select salary from Employee E2
where E2.id = E1.managerId)

# select e.name as Employee
# from Employee e, Employee m
# where e.managerId is not NULL and
# e.managerId = m.id and e.salary > m.salary