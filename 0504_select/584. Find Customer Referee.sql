select name from customer where referee_id != 2 or referee_id IS NULL

--같지 않음을 표현하는 연산자
--!=
--^=
--<>

SELECT name
FROM customer
WHERE referee_id <> 2 OR referee_id IS NULL

