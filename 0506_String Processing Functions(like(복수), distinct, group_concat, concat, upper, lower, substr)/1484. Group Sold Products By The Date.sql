--There is no primary key for this table, it may contain duplicates.
select sell_date, count(distinct product) as num_sold,
group_concat(distinct product order by product asc) as products
from Activities
group by sell_date

----------------------------------------------------------------------
SELECT
    sell_date,
    COUNT(DISTINCT product) AS num_sold,
    GROUP_CONCAT(DISTINCT product ORDER BY product) AS products
FROM Activities
GROUP BY sell_date;
