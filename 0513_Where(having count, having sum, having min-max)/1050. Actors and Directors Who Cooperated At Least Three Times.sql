-- (actor__id, director_id) 쌍이 count 수만큼 나옴
select actor_id, director_id
from actordirector
group by actor_id, director_id
having count(*) >= 3

