select
	if(grouping(s_name), "총합계", s_name)"펀드운용사",
    if(grouping(type), "합계", type)"펀드유형",
    sum(tt_amount) as "수익집계"
from (
select
	s_name, type,
	case
		when fee_type="S" then truncate(sum(t_amount) - sum(t_amount) * 0.015, 0)
		when fee_type="N" then truncate(sum(t_amount) - sum(t_amount) * 0.03, 0)
	end as tt_amount
from ((
select *
from sales
left join shops on sales.f_shop = shops.seq
) ss left join fund_method on f_method = fund_method.id)
where type = "주식형" or (type = "채권형" and is_selling = "Y")
group by f_shop, f_method
order by f_shop
) tt
group by s_name, type
with rollup
