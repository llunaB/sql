-------------------------------------------------------
-------------------------------------------------------
-- if
IF(condition, value_if_true, value_if_false)

-- condition
CASE
    WHEN condition1 THEN result1
    WHEN condition2 THEN result2
    WHEN conditionN THEN resultN
    ELSE result
END;
-------------------------------------------------------
-------------------------------------------------------

--id가 홀수이면서 이름이 M으로 시작하지 않으면 100%
--아니라면 0
select employee_id,
if (employee_id % 2 != 0 and name not like 'M%', salary, 0) as bonus
from employees
order by employee_id;
-------------------------------------------------------
select employee_id,
case
    when employee_id % 2 != 0 and name not like 'M%' then salary
    else 0
end as bonus
from employees
order by employee_id;

