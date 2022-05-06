-- group by
-- having count
-- order by
-- ...

select customer_number
from orders
group by customer_number

having count(customer_number) = (
select count(order_number) cnt
from orders
group by customer_number
order by cnt desc
limit 1)

# order by ...


---------------------------------------------

select customer_number
from orders
group by customer_number
having count(order_number) = (
    select count(order_number) cnt
    from orders
    group by customer_number
    order by cnt desc
    limit 1
)

----------------------------------------------

select customer_number
from orders
group by customer_number
order by COUNT(*) DESC
limit 1