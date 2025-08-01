-- Write a solution to find the patient_id, patient_name, and conditions of the patients who have Type I Diabetes. Type I Diabetes always starts with DIAB1 prefix.

-- Return the result table in any order.

Select *
from Patients
WHERE conditions LIKE '% DIAB1%'  
    OR conditions LIKE 'DIAB1%'   
    OR conditions LIKE '% DIAB1'  
    OR conditions = 'DIAB1'