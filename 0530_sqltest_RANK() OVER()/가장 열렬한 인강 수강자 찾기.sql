SELECT RANK() OVER (ORDER BY total_study_time DESC) rank_no,
group_name, user_name, total_study_time

FROM
(SELECT (
  SELECT GI.group_name FROM GROUP_INFO GI
  WHERE GI.group_code = UI.group_code
	) as group_name,
  user_name, total_study_time

FROM
(SELECT user_idx, sum(study_time) as total_study_time
FROM LECTURE_HISTORY
GROUP BY user_idx
ORDER BY total_study_time DESC) TMP

LEFT JOIN USER_INFO UI

ON UI.user_idx = TMP.user_idx

ORDER BY total_study_time DESC, user_name ASC        <======###################이거!!!!! ㅠㅠㅠㅠㅠ

) AS TMP2

ORDER BY rank_no DESC, user_name ASC        <======############################ 또는 이거!!!!! ㅠㅠㅠㅠㅠ
LIMIT 10