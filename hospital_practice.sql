create schema evening;

show search_path;

set search_path to evening;

--create doctors table

create table doctors (
doctor_id int primary key,
doctor_name varchar(50) not null,
doctor_gender varchar(20),
doctor_specialty varchar(20),
doctor_experience_years int
);

select * from doctors;

insert into doctors (doctor_id, doctor_name, doctor_gender, doctor_specialty, doctor_experience_years)
values 
(101, 'DR.Brian Mwangi', 'Male', 'Cardiologist', 12),
(102, 'Dr. Sarah Wanjiku', 'Female', 'General Physician', 9), 
(103, 'Dr. Peter Otieno', 'Male', 'Orthopedic Surgeon', 15),
(104, 'Dr. Faith Chebet', 'Female', 'Pediatrician', 8);


-- Departments Table

create table department (
department_id int primary key,
department_name varchar (50) not null
);


select * from department;


insert into department (department_id, department_name)
values 
(10, 'Cardiology'),
(20, 'General Medicine'),
(30, 'Orthopedics'),
(40, 'Pediatrics');

-- Diagnosis Table

create table diagnosis (
diagnosis_id int primary key,
diagnosis_name varchar(50),
diagnosis_category varchar(50)
);

select * from evening.diagnosis;

insert into diagnosis (diagnosis_id, diagnosis_name, diagnosis_category)
values 
(501,'Hypertension', 'Chronic Disease'),
(502, 'Malaria', 'Infectious Disease'),
(503, 'Fracture', 'Injury'),
(504, 'Pneumonia', 'Respiratory Disease'),
(505, 'Diabetes', 'Chronic Disease'),
(506, 'Typhoid', 'Infectious'),
(507, 'Asthma', 'Respiratory Disease'),
(508, 'Back Pian', 'Musculoskeletal'),
(509, 'Gastritis', 'Digestive Disease'),
(510, 'Heart Failure', 'Chronic Disease'),
(511, 'Flu', 'Respiratoey Disease'),
(512, 'Kidney Infection', 'Infectious Disease'),
(513, 'Anaemia', 'Blood Disorder'),
(514, 'Sprain', 'Injury'),
(515, 'Gastroenteritis', 'Digestive Disease'),
(516, 'Dislocation', 'Injury'),
(517, 'Migraine', 'Neurological Disorder'),
(518, 'Chest Pain', 'Cardiovascular Disease');

-- Wards Table 

create table wards (
ward_id int primary key, 
ward_name varchar (50)
);

insert into wards (ward_id, ward_name)
values 
(100, 'Cardiac Care Unit'),
(200, 'General Ward'),
(300, 'Surgical Ward'),
(400, 'Childrens Ward');

select * from wards;

-- Patients Table 
create table patients (
patient_id serial primary key, 
patient_name varchar(50) not null,
patient_gender varchar(20),
patient_age int,
county varchar(30),
sub_county varchar(30)
);

insert into patients (patient_name, patient_gender, patient_age, county, sub_county)
values 
('Amina Otieno', 'Female', 34, 'Nairobi', 'Westlands'),
('John Kariuki', 'Male', 42,' Kiambu', 'Thika'),
('Grace Naliaka', 'Female', 28, 'Kakamega', 'Lurambi'),
('David Mutua', 'Male', 55, 'Machakos', 'Athi River'),
('Esther Achieng', 'Female', 63, 'Kisumu', 'Kisumu Central'),
('Mohamed Ali', 'Male', 19, 'Mombasa', 'Nyali'),
('Lucy Wambui', 'Female', 7, 'Nakuru', 'Naivasha'),
('Samuel Kiptoo', 'Male', 39, 'Uasin Gishu', 'Eldoret East'),
('Mary Wairumu', 'Female', 31, 'Murang''a', 'Kiharu'),
('Peter Ouma', 'Male', 46, 'Siaya', 'Bondo'),
('Brian Omondi', 'Male', 24, 'Kisumu', 'Kisumu East'),
('Catherine Musyoka', 'Female', 52, 'Kitui', 'Kitui Central'),
('Daniel Maina', 'Male', 16, 'Nyeri', 'Othaya'),
('Eunice Moraa', 'Female', 44, 'Kisii', 'Bonchari'),
('Francis Njuguna', 'Male', 60, 'Laikipia', 'Nyanyuki'),
('Hellen Jepchirchir', 'Female', 37, 'Bomet', 'Sotik'),
('Isaac Kamau', 'Male', 29, 'Nairobi', 'Kasarani'),
('Jane Muthoni', 'Female', 22, 'Meru', 'Imenti North'),
('Kevin Barasa', 'Male', 48, 'Bungoma', 'Webuye'),
('Lilian Adhiambo', 'Female', 26, 'Homa Bay', 'Rangwe'),
('Moses Cheruiyot', 'Male', 33, 'Kericho', 'Ainamoi'),
('Nadia Hussein', 'Female', 5, 'Garissa', 'Dadaab'),
('Patrick Muli', 'Male', 51, 'Makueni', 'Wote'),
('Ruth Nekesa', 'Female', 41, 'Trans Nzoia', 'Kitale'),
('Josephine Wekesa', 'Female', 36, 'Busia', 'Matayos');

select * from patients;

-- Procedures Table

create table procedures (
procedure_id int primary key,
procedure_name varchar (50) not null,
procedure_category varchar (20)
);



insert into procedures (procedure_id, procedure_name, procedure_category)
values
(701, 'Blood Pressure Monitoring', 'Diagnostic'),
(702, 'Malaria Test', 'Laboratory'),
(703, 'X-ray', 'Imaging'),
(704, 'Chest X-ray', 'Imaging'),
(705, 'Blood Sugar Test', 'Laboratory'),
(706, 'Full Blood Count', 'Laboratory'),
(707, 'Nebulization', 'Treatment'),
(708, 'Physiotherapy', 'Treatment'),
(709, 'Endoscopy', 'Diagnostic'),
(710, 'ECG', 'Diagnostic'),
(711, 'Consultation', 'Consultation'),
(712, 'Joint Support Bandage', 'Treatment'),
(713, 'IV Fluids', 'Treatment'),
(714, 'Closed Reduction', 'Treatment'),
(715, 'Pain Management', 'Treatment');


select * from procedures;


-- Visits Table (Fact Table)

create table visits (
visit_id int primary key,
visit_date date not null,
patient_id int not null references patients(patient_id),
doctor_id int not null references doctors(doctor_id),
department_id int not null references department(department_id),
ward_id int references wards(ward_id),
diagnosis_id int references diagnosis(diagnosis_id),
procedure_id int references procedures(procedure_id),
admission_type varchar(20) not null
    check (admission_type in ('Outpatient', 'Inpatient', 'Emergency')),
length_of_stay_days int default 0
    check (length_of_stay_days >= 0),
triage_level varchar(10)
    check (triage_level in ('Red', 'Orange', 'Yellow', 'Green')),
insurance_provider varchar(50),
total_bill_kes numeric(10,2) not null
    check (total_bill_kes >= 0),
payment_method varchar(20),
follow_up_required varchar(3)
    check (follow_up_required in ('Yes', 'No')),
patient_satisfaction_score numeric(3,1)
    check (patient_satisfaction_score between 0 and 5)
);

select * from visits;

insert into visits (visit_id, visit_date, patient_id, doctor_id, department_id, ward_id, diagnosis_id,
procedure_id, admission_type, length_of_stay_days, triage_level, insurance_provider, total_bill_kes, payment_method,
follow_up_required, patient_satisfaction_score)
values
(1001, '2026-06-01', 1, 101, 10, 100, 501, 701, 'Outpatient', 0, 'Green', 'NHIF', 3500, 'Cash', 'Yes', 4.5),
(1002, '2026-06-01', 2, 102, 20, 200, 502, 702, 'Outpatient', 0, 'Yellow', 'Britam', 2500, 'Insurance', 'No', 4.1),
(1003, '2026-06-02', 3, 103, 30, 300, 503, 703, 'Inpatient', 3, 'Red', 'AAR', 28000, 'Insurance', 'Yes', 4.3),
(1004, '2026-06-02', 4, 104, 40, 400, 504, 704, 'Inpatient', 4, 'Red', 'None', 42000, 'Cash', 'Yes', 3.9),
(1005, '2026-06-03', 5, 101, 10, 100, 505, 705, 'Outpatient', 0, 'Yellow', 'CIC', 4000, 'Mobile Money', 'Yes', 4.7),
(1006, '2026-06-03', 6, 102, 20, 200, 506, 706, 'Outpatient', 0, 'Green', 'None', 3000, 'Cash', 'No', 4.0),
(1007, '2026-06-04', 7, 104, 40, 400, 507, 707, 'Outpatient', 0, 'Yellow', 'NHIF', 5500, 'Insurance', 'Yes', 4.6),
(1008, '2026-06-04', 8, 103, 30, 300, 508, 708, 'Outpatient', 0, 'Green', 'None', 6500, 'Cash', 'Yes', 4.2),
(1009, '2026-06-05', 9, 102, 20, 200, 509, 709, 'Outpatient', 0, 'Yellow', 'Jubilee', 15000, 'Insurance', 'No', 3.8),
(1010, '2026-06-05', 10, 101, 10, 100, 510, 710, 'Inpatient', 5, 'Red', 'AAR', 76000, 'Insurance', 'Yes', 4.4),
(1011, '2026-06-06', 1, 101, 10, 100, 505, 705, 'Outpatient', 0, 'Green', 'NHIF', 4200, 'Mobile Money', 'Yes', 4.8),
(1012, '2026-06-06', 11, 102, 20, 200, 502, 702, 'Outpatient', 0, 'Green', 'None', 2300, 'Cash', 'No', 4.0),
(1013, '2026-06-07', 12, 101, 10, 100, 501, 710, 'Outpatient', 0, 'Yellow', 'Britam', 7000, 'Insurance', 'Yes', 4.5),
(1014, '2026-06-07', 13, 104, 40, 400, 511, 711, 'Outpatient', 0, 'Green', 'None', 1800, 'Cash', 'No', 4.1),
(1015, '2026-06-08', 14, 103, 30, 300, 503, 703, 'Inpatient', 2, 'Red', 'CIC', 24000, 'Mobile Money', 'Yes', 4.6),
(1016, '2026-06-08', 15, 102, 20, 200, 512, 706, 'Inpatient', 3, 'Orange', 'Jubilee', 36000, 'Insurance', 'Yes', 3.7),
(1017, '2026-06-09', 16, 101, 10, 100, 510, 710, 'Inpatient', 6, 'Red', 'AAR', 82000, 'Insurance', 'Yes', 4.2),
(1018, '2026-06-09', 17, 102, 20, 200, 509, 711, 'Outpatient', 0, 'Green', 'None', 2000, 'Cash', 'No', 4.0),
(1019, '2026-06-10', 18, 104, 40, 400, 507, 707, 'Outpatient', 0, 'Yellow', 'NHIF', 5200, 'Mobile Money', 'Yes', 4.7),
(1020, '2026-06-10', 19, 103, 30, 300, 508, 708, 'Outpatient', 0, 'Green', 'Britam', 6500, 'Insurance', 'No', 4.1),
(1021, '2026-06-11', 2, 101, 10, 100, 501, 701, 'Outpatient', 0, 'Yellow', 'Britam', 3800, 'Insurance', 'Yes', 4.3),
(1022, '2026-06-11', 20, 102, 20, 200, 513, 706, 'Outpatient', 0, 'Green', 'None', 3200, 'Mobile Money', 'No', 4.4),
(1023, '2026-06-12', 21, 103, 30, 300, 514, 712, 'Outpatient', 0, 'Yellow', 'NHIF', 7200, 'Cash', 'Yes', 4.0),
(1024, '2026-06-12', 22, 104, 40, 400, 515, 713, 'Inpatient', 2, 'Orange', 'None', 18500, 'Cash', 'Yes', 4.5),
(1025, '2026-06-13', 5, 101, 10, 100, 501, 710, 'Outpatient', 0, 'Yellow', 'CIC', 7600, 'Insurance', 'Yes', 4.6),
(1026, '2026-06-13', 23, 102, 20, 200, 506, 706, 'Inpatient', 2, 'Orange', 'Jubilee', 29000, 'Insurance', 'Yes', 3.9),
(1027, '2026-06-14', 24, 103, 30, 300, 516, 714, 'Inpatient', 1, 'Red', 'AAR', 33000, 'Insurance', 'Yes', 4.2),
(1028, '2026-06-14', 7, 104, 40, 400, 511, 711, 'Outpatient', 0, 'Green', 'NHIF', 1900, 'Mobile Money', 'No', 4.8),
(1029, '2026-06-15', 25, 102, 20, 200, 517, 715, 'Outpatient', 0, 'Yellow', 'Britam', 4800, 'Cash', 'Yes', 4.1),
(1030, '2026-06-15', 10, 101, 10, 100, 518, 710, 'Emergency', 1, 'Red', 'AAR', 22000, 'Insurance', 'Yes', 4.4);

select * from visits;

set search_path to public;

select * from doctors;

delete from public.doctors where doctor_id = 101;

select * from visits limit 3;

--WHERE

select patient_id, doctor_id, total_bill_kes  from visits where total_bill_kes >= 40000;

select doctor_id, doctor_experience_years from doctors where doctor_experience_years < 10;

select patient_id, patient_age from patients where patient_age > 40;

select * from patients 
where patient_gender = 'Male' and patient_age > 40 and county = ' Kiambu';

--IN

select * from visits v where v.insurance_provider in ('Britam', 'NHIF');

--BETWEEN
select * from visits v where v.total_bill_kes between 10000 and 40000;

--ORDER BY
select * from visits v order by v.visit_date;

select * from patients p order by p.patient_name desc;

--GROUP BY

select SUM(total_bill_kes) as "Total Bill" from visits v;

select p.patient_gender,  AVG(p.patient_age) as "Average Age" from patients p group by p.patient_gender;

select doctor_id, SUM(total_bill_kes) as "Total Bill" from visits v group by doctor_id;

select v.payment_method, SUM(v.total_bill_kes) from visits v group by v.payment_method;

select v.insurance_provider, SUM(v.total_bill_kes) as "Revenue" from visits v group by v.insurance_provider order by SUM(v.total_bill_kes ) desc;

select v.insurance_provider, count(v.patient_id ) from visits v
where v.insurance_provider not in ('None')
group by v.insurance_provider order by count(v.patient_id) desc;


select patient_id, count(patient_id) as "Number of Visits"  from visits 
group by patient_id having count(patient_id ) > 1 
order by count(patient_id) desc;

select count(*) as visits from visits v where v.visit_date between '2026-06-05' and '2026-06-10' and v.payment_method in ('Cash', 'Mobile Money');


select patient_age, p.patient_age % 2 as new_age from patients p;