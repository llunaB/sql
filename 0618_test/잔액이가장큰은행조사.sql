"""
group by 전에 조건을 주면, 조건을 걸고 그룹화한다.
group by 이후에 having 으로 조건을 주면, 그룹화한 결과를 필터링한다.
"""

select bank_name, sum(balance) as balance_sum
from accounts
where balance > 10
group by bank_name
order by balance_sum desc
-- having sum(balance) > 10