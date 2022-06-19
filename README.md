# SQL

## SQL 내부처리 순서

```sql
WHERE -> GROUP BY -> SELECT -> ORDER BY
```



## SQL 기술 순서

```sql
SELECT -> FROM -> WHERE -> GROUP BY -> HAVING -> ORDER BY
```



## where > group by

- 특정 조건을 만족하는 row 만 그룹화할 경우
- group by 전에 조건을 주면, 조건을 걸고 그룹화한다.

```sql
select bank_name, sum(balance) as balance_sum
from accounts
where balance > 10
group by bank_name
order by balance_sum desc
```



## group by > having

- group by 결과물에 조건을 걸 경우
- group by 이후에 having 으로 조건을 주면, 그룹화한 결과를 필터링한다.

```sql
select bank_name, sum(balance) as balance_sum
from accounts
where balance > 10
group by bank_name
having sum(balance) > 10
order by balance_sum desc
```

