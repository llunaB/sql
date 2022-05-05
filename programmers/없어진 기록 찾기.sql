select ao.animal_id, ao.name from animal_outs ao
left join animal_ins ai
on ao.animal_id = ai.animal_id
where ai.datetime is null
order by animal_id