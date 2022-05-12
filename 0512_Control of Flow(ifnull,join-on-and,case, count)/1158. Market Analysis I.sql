select u.user_id as buyer_id,
u.join_date, count(o.order_date) as orders_in_2019
from users u left join orders o
on u.user_id = o.buyer_id
and year(o.order_date) = '2019'
group by u.user_id

##################################################

-- sum 사용
select u.user_id as buyer_id, join_date, sum(case when year(o.order_date) = '2019' then 1 else 0 end) as orders_in_2019
from Users u left join Orders o on u.user_id = o.buyer_id
group by u.user_id

-- join, on, and 사용
SELECT u.user_id AS buyer_id, join_date, COUNT(order_date) AS orders_in_2019
FROM Users as u
LEFT JOIN Orders as o
ON u.user_id = o.buyer_id
AND YEAR(order_date) = '2019'
GROUP BY u.user_id