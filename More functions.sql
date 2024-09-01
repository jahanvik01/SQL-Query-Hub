create database healthcare;

use healthcare;

select * from appointments;
select * from doctors;
select * from medical_records;
select * from patients;
select * from prescriptions;

SET SQL_SAFE_UPDATES = 0;

ALTER TABLE appointments 
ADD COLUMN new_appointment_date DATE;
UPDATE appointments
SET new_appointment_date = STR_TO_DATE(appointment_date, '%d-%m-%Y');
ALTER TABLE appointments DROP COLUMN appointment_date;
ALTER TABLE appointments CHANGE COLUMN new_appointment_date appointment_date DATE;

ALTER TABLE medical_records 
ADD COLUMN new_record_date DATE;
UPDATE medical_records
SET new_record_date = STR_TO_DATE(record_date, '%d-%m-%Y');
ALTER TABLE medical_records DROP COLUMN record_date;
ALTER TABLE medical_records CHANGE COLUMN new_record_date record_date DATE;

ALTER TABLE patients
ADD COLUMN birth_date DATE;
UPDATE patients
SET birth_date = STR_TO_DATE(dob, '%d-%m-%Y');
ALTER TABLE patients DROP COLUMN dob;
ALTER TABLE patients CHANGE COLUMN birth_date dob DATE;

ALTER TABLE prescriptions
ADD COLUMN date_of_start DATE;
UPDATE prescriptions
SET date_of_start = STR_TO_DATE(start_date, '%d-%m-%Y');
ALTER TABLE prescriptions DROP COLUMN start_date;
ALTER TABLE prescriptions CHANGE COLUMN date_of_start start_date DATE;

ALTER TABLE prescriptions
ADD COLUMN date_of_end DATE;
UPDATE prescriptions
SET date_of_end = STR_TO_DATE(end_date, '%d-%m-%Y');
ALTER TABLE prescriptions DROP COLUMN end_date;
ALTER TABLE prescriptions CHANGE COLUMN date_of_end end_date DATE;


-- Retrieve a list of all patient names who either have an appointment or a medical record, ensuring that no duplicate names appear. --
select patient_id from patients
where patient_id in (select patient_id from appointments)
union
select patient_id from patients
where patient_id in  (select patient_id from medical_records);

-- Find the patient names who have both an appointment and a medical record.
select patient_id, full_name from patients
where patient_id in (select patient_id from appointments)
and patient_id in  (select patient_id from medical_records);

-- Get a complete list of all patient names who either have an appointment or a medical record, including duplicates.
select patient_id from patients
where patient_id in (select patient_id from appointments)
union all
select patient_id from patients
where patient_id in  (select patient_id from medical_records);

-- Retrieve the full name and age of all patients by extracting the year from their date of birth.
select full_name, year(curdate())-year(dob) as age from patients; 

-- List all appointments scheduled in the last 30 days.
SELECT * FROM appointments 
WHERE appointment_date >= CURDATE() - INTERVAL 30 DAY;

-- Find the names of doctors who have more than 10 appointments scheduled.
select full_name from doctors 
where doctor_id in (select doctor_id from appointments
group by doctor_id 
having count(*)>10);

-- Retrieve the details of patients who have not had an appointment in the last 6 months.
select * from patients 
where patient_id not in (
select patient_id from appointments
where appointment_date >= curdate() - interval 6 month);

-- List all appointments and categorize them as 'Recent' if they were scheduled within the last 15 days, and 'Old' otherwise.
 select appointment_id, patient_id,
 case
 when appointment_date >= curdate() - interval 15 day then 'Recent'
 else 'Old'
 end as appointment_category
 from appointments;

-- Show the full names of patients along with their age group (e.g., 'Child', 'Adult', 'Senior').
select full_name,  year(curdate())-year(dob) as age,
case 
when (year(curdate())-year(dob)) <= 12 then 'Child'
when (year(curdate())-year(dob)) between 18 and 40 then 'Adult'
when (year(curdate())-year(dob)) > 40 then 'Senior'
else 'Teen'
end as age_category
from patients;

-- Retrieve the first 10 appointments from the appointments table.
select * from appointments 
limit 10;

-- Retrieve 10 records from the patients table, starting from the 20th record.
select * from appointments 
limit 19, 10;

/* Begin a transaction where you update the status of a specific appointment, set a savepoint, then update the diagnosis in the appointments table. 
 If an error occurs, roll back to the savepoint, otherwise commit the transaction. */
 start transaction;
 update appointments set status = 'Completed'
 where appointment_id = '1';
 savepoint update_status;
 update appointments set diagnosis = 'Asthma'
 where appointment_id = '1';
 -- error occur --
 rollback to update_status;
 -- everything is good --
 commit;

-- Find all patients whose full name starts with the letter 'A'.
select full_name from patients 
where full_name like 'A%';

-- Retrieve all email addresses from the doctors table that contain the domain hospital.com.
select email from doctors
where email like '%yahoo.com%';

-- List all doctors who have never been assigned to an appointment.
select full_name from doctors as d 
where not exists (
select * from appointments as a
where d.doctor_id = a.doctor_id);

-- Find all patients who have a medical record.
select patient_id, full_name, gender, email from patients as p
where exists (
select patient_id from medical_records as md
where p.patient_id = md.patient_id);

-- Retrieve the details of the doctor who has the highest number of appointments scheduled.
select * from doctors 
where doctor_id = 
(select doctor_id from appointments
group by doctor_id
order by count(*)
limit 1);

-- Extract the month and year from the appointment_date and list them along with the number of appointments scheduled in each month.
select extract(year from appointment_date) as year,
extract(month from appointment_date) as month,
count(*) as total_appointments 
from appointments
group by year, month;

-- Extract the year from the dob of patients and count how many patients were born in each year.
select extract(year from dob) as year,
count(*) as total_born
from patients
group by year
order by year;