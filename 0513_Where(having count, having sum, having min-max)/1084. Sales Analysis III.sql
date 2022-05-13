-- not in 하면 예외상황이 많아서 에러남
-- in 또는 having 으로 grouping과 함께 조건을 걸어주어야 한다.
-- min, max 활용하자. 팔린 가장 빠른 날이 범위 이상, 가장 느린 날이 범위 이하면 된다.

SELECT s.product_id, product_name
FROM Sales s
LEFT JOIN Product p
ON s.product_id = p.product_id
GROUP BY s.product_id
HAVING MIN(sale_date) >= CAST('2019-01-01' AS DATE) AND
       MAX(sale_date) <= CAST('2019-03-31' AS DATE)


SELECT product_id, product_name
FROM Product
WHERE product_id IN
(SELECT product_id
FROM Sales
GROUP BY product_id
HAVING MIN(sale_date) >= '2019-01-01' AND MAX(sale_date) <= '2019-03-31')
