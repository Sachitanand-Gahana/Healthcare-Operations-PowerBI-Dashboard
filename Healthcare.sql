use Healthcare

select* from healthcare_dataset;


-- Total Patient & Total Revenue 
select count(*) as total_patient,
	   cast(sum(billing_amount)as decimal(20,2)) as total_revenue,
	   cast(avg(billing_amount) as decimal(10,2)) as verage_bill_per_patient
from healthcare_dataset;


-- Top 3 Medical Condition
select top 3 medication,count(*) as Total_case , cast(sum(billing_amount)as decimal(20,2)) as total_revenue
from healthcare_dataset
group by medication 
order by total_revenue desc;


-- Patient Length of Stay (LOS) Analysis
select Medical_Condition, avg(DATEDIFF(day,Date_of_Admission,Discharge_Date)) as avg_day_admit, count(*) as Total_patients
from healthcare_dataset
group by Medical_Condition;


-- Admission Type vs Emergency Rush
select Admission_Type, count(*) as total_patients,cast(sum(billing_amount)as decimal(10,2)) as total_billing, 
cast(avg(billing_amount)as decimal(10,2)) as avg_billing_per_case 
from healthcare_dataset
group by Admission_Type
order by total_billing desc;



-- Insurance Provider Market Share
select Insurance_Provider, count(*) as Patients_Insured, cast(sum(billing_amount)as decimal(10,2)) as total_claim_amount
from healthcare_dataset
group by Insurance_Provider
order by total_claim_amount desc;



-- Age Group vs Medical Condition
select case when age <18 then 'Under 18 (Children)'
			when age between 18 and 50 then '18 - 50 (Adults)' else '50+ (Senior Citizens)' end as age_group,
medical_condition, count(*) as total_cases from healthcare_dataset
group by case when age <18 then 'Under 18 (Children)'
			  when age between 18 and 50 then '18 - 50 (Adults)' else '50+ (Senior Citizens)' end,
medical_condition
order by total_cases desc;





