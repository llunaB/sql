# between a and b 의 경우 이상, 이하긴 하지만 날짜의 경우 23:59:59까지 적어주어야 안전하다.

select user_id, max(time_stamp) as last_stamp from logins
where year(time_stamp) = 2020
group by user_id

#####################################################

SELECT user_id, MAX(time_stamp) AS last_stamp
FROM Logins WHERE YEAR(time_stamp) = 2020 GROUP BY user_id


SELECT user_id, max(time_stamp) as last_stamp
FROM Logins
WHERE time_stamp BETWEEN '2020-01-01' AND '2020-12-31 23:59:59'
GROUP BY user_id