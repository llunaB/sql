select t1.id from weather t1,weather t2
where t1.temperature > t2.temperature
and datediff(t1.recordDate, t2.recordDate) = 1








-- sol 1
SELECT w1.id
FROM Weather AS w1 , Weather AS w2
WHERE w1.Temperature > w2.Temperature AND DATEDIFF(w1.recordDate , w2.recordDate) = 1

-- sol 2
SELECT t1.Id
FROM Weather t1
INNER JOIN Weather t2
ON TO_DAYS(t1.Date) = TO_DAYS(t2.Date) + 1
WHERE t1.Temperature > t2.Temperature



-- error
SELECT w1.Id as Id
FROM Weather as w1 INNER JOIN Weather as w2
ON w1.Date = (w2.Date + 1)  --=> error!!!!!!!!!!!!!!!!!!!!! [DATETIME] + 1 means 'same time the next day'.
WHERE w1.Temperature > w2.Temperature;
