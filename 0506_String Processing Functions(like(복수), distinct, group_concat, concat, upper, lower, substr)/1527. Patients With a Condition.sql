select patient_id, patient_name, conditions
from patients
where conditions like 'DIAB1%' or
conditions like '% DIAB1%'


-------------------------------------------------
# SELECT * FROM PATIENTS WHERE
# CONDITIONS LIKE '% DIAB1%' OR
# CONDITIONS LIKE 'DIAB1%';