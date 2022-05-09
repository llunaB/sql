select v.customer_id, count(v.customer_id) as count_no_trans from visits v
left join transactions t
on v.visit_id = t.visit_id
where t.amount is null
group by v.customer_id