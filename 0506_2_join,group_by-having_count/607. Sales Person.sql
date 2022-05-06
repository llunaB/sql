select s.name from salesperson s
where s.sales_id not in (
    select o.sales_id from orders o left join company c
    on o.com_id = c.com_id
    where c.name = 'RED'
)

-----------------------------

select s.name
from Salesperson s
where s.sales_id
not in
(
select o.sales_id from Orders o left join Company c
on o.com_id = c.com_id
where c.name = 'RED'
)