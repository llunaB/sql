select animal_type, count(*) as count from animal_ins
group by animal_type
order by animal_type
