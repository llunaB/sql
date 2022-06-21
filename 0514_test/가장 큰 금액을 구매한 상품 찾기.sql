-- 몰라 어려워..ㅠㅠ

SELECT tmp2.user_id as USER_ID, tmp2.name as NAME, max(tmp2.SPENT) as SPENT
from (
    SELECT name, sum(price) as SPENT, user_id
from cart_products cp
left join carts c
on cp.cart_id = c.id
group by c.user_id, cp.name
having SPENT in (
select max(p) from (
select cart_id, name, sum(price) as p from cart_products
group by cart_id, name
) as tmp
group by tmp.cart_id
)
) as tmp2
group by user_id
order by USER_ID, NAME