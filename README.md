# ORACLE DB

## Oracle Data Type

#### CHAR(n)

- 고정길이 문자 (숫자인 문자열)

#### VARCHAR2(n)

- 가변길이 문자 (문자열)

#### NUMBER(P, S)

- 가변숫자

#### DATE

- 날짜



## Alias 표현방법 3가지

```sql
SELECT sal*12 AS "ANNSAL",
			 sal*12 "ANNSAL",
			 sal*12 ann_sal
FROM emp;
```



## ORDER BY 표현방법 3가지

```sql
ORDER BY sal*12 DESC, ename;  # column
ORDER BY 4 DESC, ename;	# 위치지시자
ORDER BY "연봉" DESC, ename;	# alias
```



## NULL 처리

```sql
SELECT *
FROM emp
WHERE ename IS NOT NULL;
```



## Function 

- 단일행
  - `SUBSTR(문자열, 시작위치, 길이)`
  - `REPLACE(문자열, '찾을문자', '바꿀문자')`
  - `CONCAT(문자열 || ' ' || 문자열2) ` => 문자열 사이에 공백만들기
  - `ROUND(숫자, 자릿수)`
  - `TRUNC(숫자, 자릿수)`
  - `SYSDATE`
  - `NVL(comm, NULL일때)`
  - `NVL2(comm, NULL 이 아닐때, NULL일때)`
  - `TO_CHAR(SYSDATE, '원하는 날짜 포맷')`
  - `TO_DATE`
  - `TO_NUMBER`
- 다중행
  - GROUP BY
  - ORDER BY



## CASE의 활용

- 기본형 

```sql
SELECT CASE WHEN 조건1 THEN 결과1
						WHEN 조건2 THEN 결과2
						ELSE 결과3
			 END
FROM tbl;
```

- 응용

```sql
SELECT 기준, 
	SUM(CASE WHEN 조건1 THEN 1 ELSE 0 END) 별칭1
	SUM(CASE WHEN 조건2 THEN 1 ELSE 0 END) 별칭2
	SUM(CASE WHEN 조건3 THEN 1 ELSE 0 END) 별칭3
FROM tbl
GROUP BY 기준;
```





## 문자 표현과 문자 인코딩

### ASCII? UNICODE? 인코딩? UTF-8?

- **아스키 코드란?**

  영문 알파벳을 사용하는 대표적인 문자 코드이다. 

  7비트를 사용한다. (2의 7승)

- **유니코드란?**

​        전 세계의 모든 문자를 컴퓨터에서 일관되게 표현하고 다룰 수 있도록 설계된 표준 코드.

​		2바이트, 16비트를 사용한다. 물론 아스키 코드도 포함한다.

​		2BYTE 로 한글을 표현한다. (range = AC00 ~ D7AF)

- **인코딩 방식이란?**

  컴퓨터가 어떤 문자를 만났을 때, 얼마만큼씩 읽어야 하는지 미리 말해주는 것.

- **UTF-8 이란? (8-bit Unicode Transformation Format)**

  유니코드를 인코딩하여 8비트 숫자의 집합으로 나타내는 방식.

  '문자열 집합과 인코딩 현태를 8비트 단위로 한다!'

  유니코드 한 문자를 나타내기 위해 1~4바이트(가변길이)를 사용한다.

  왜? ASCII 문자들은 1byte로도 표현이 가능하기 때문이다.

  한글 한 글자는 3BYTE이다.




## 집계함수

## 분석함수



---



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



## A별 B별 그루핑

- group by 2개로 : shop 별 method 별 그루핑

```sql
select *
from sales
left join shops on sales.f_shop = shops.seq
) ss left join fund_method on f_method = fund_method.id)
where type = "주식형" or (type = "채권형" and is_selling = "Y")
group by f_shop, f_method
order by f_shop
) tt
```



## CASE WHEN THEN 조건에 따른 SELECT 문

- fee_type이 "S" 이면 0.015, "N"이면 0.03 을 곱한 결과를 출력

```sql
select
	s_name, type,
	case
		when fee_type="S" then truncate(sum(t_amount) - sum(t_amount) * 0.015, 0)
		when fee_type="N" then truncate(sum(t_amount) - sum(t_amount) * 0.03, 0)
	end as tt_amount
from
...
```



## 소수점 반올림(round), 올림(ceil), 내림(floor), 버림(truncate)

```sql
select truncate(1.5, 0)  -- 1
select round(1.5, 0)  -- 2
select ceil(1.5, 0) -- 1
select floor(1.5, 0) -- 1
```



## 총합계 내기 with rollup + 열까지 지정하기

```sql
select 
	if(grouping(s_name), "총합계", s_name)"펀드운용사", 
    if(grouping(type), "합계", type)"펀드유형",
    sum(tt_amount) as "수익집계"
from (
...
	) tt
group by s_name, type
with rollup
```

![with rollup](with rollup.png)
