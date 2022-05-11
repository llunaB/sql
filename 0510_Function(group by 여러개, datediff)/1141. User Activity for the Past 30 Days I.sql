# Write your MySQL query statement below
# datediff(더 큰 날짜(나중날짜) - 더 적은 날짜(더 이전 날짜))
# 30이면 6.27도 포함이기 때문에, 30미만이어야 한다.
# 7.27을 마지막 날로 포함하여 30일을 계산하기 때문

select activity_date as day, count(distinct user_id) as active_users
from activity
where datediff('2019-07-27', activity_date) < 30
and activity_date <= '2019-07-27'
group by activity_date


#############################################