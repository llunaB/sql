select customer_number
from
(
select customer_number, count(order_number) as c
from orders
group by customer_number
) as a
where a.c = max(count(order_number))



select customer_number from orders
group by customer_number
order by count(*) desc limit 1;



SELECT  customer_number
FROM    orders
GROUP BY customer_number
ORDER BY COUNT(order_number) DESC
LIMIT 1



select customer_number
from orders
group by customer_number
having count(customer_number) = (
select count(order_number) cnt
from orders
group by customer_number
order by cnt desc
limit 1)

