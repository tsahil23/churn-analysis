create table if not exists customer(
RowNumber INT,
CustomerId BIGINT,
Surname VARCHAR(50),
CreditScore INT,
Geography VARCHAR(50),
Gender VARCHAR(10),
Age INT,
Tenure INT,
Balance NUMERIC(12,2),
NumOfProducts INT,
HasCrCard INT,
IsActiveMember INT,
EstimatedSalary NUMERIC(12,2),
Exited INT
);

-- table successfully created and data has been imported from the csv to the db table

-- Top rows
select * from customer limit 10;

-- Display the first 10 rows to understand the structure
-- and get a quick overview of the customer data.



-- Total number of customers
select count(*) as total_customer
from customer;

--there are total 10k customers in the dataset.



--finding is there any null value in a specific column
select * from customer
where rownumber is null
or customerid is null
or surname is null
or creditscore is null 
or geography is null
or gender is null
or age is null
or tenure is null
or balance is null
or numofproducts is null
or hascrcard is null
or isactivemember is null
or estimatedsalary is null
or exited is null;

-- No NULL values were found in any of the columns.



-- Overall churn rate
select count(*) as total_customer,
sum(case when exited=1 then 1 else 0 end ) as exited_customer,
round(sum(case when exited=1 then 1 else 0 end) * 100.0 / count(*),2) as curn_rate_percentage
from customer;

-- Approximately 20% of customers have exited.
-- This means around 1 out of every 5 customers has churned.




--churn by gender
select gender,
count(*) as total_customer,
sum(case when exited=1 then 1 else 0 end) as exited_customer,
round(sum(case when exited=1 then 1 else 0 end)*100.0 /count(*),2) as churn_rate
from customer
group by gender;

-- Male customers are higher in number than female customers.
-- However, female customers have a higher churn rate than male customers.




--churn by tenure
select tenure,
count(*) as total_customer,
sum(case when exited=1 then 1 else 0 end) as exited_customer,
round(sum(case when exited=1 then 1 else 0 end)*100.0 /count(*),2) as churn_rate
from customer
group by tenure
order by tenure;

-- Churn rate varies across different customer tenure levels.
-- This helps identify whether customers are more likely to churn
-- during specific years of their relationship with the bank.



--compare churn rate by country is there any country who has high churn rate
select distinct geography,count(*) as total_customer,
sum(case when exited=1 then 1 else 0 end) as exited_customer,
round(sum(case when exited=1 then 1 else 0 end)*100.0 /count(*),2) as churn_rate
from customer
group by geography
order by churn_rate desc;

--Germany has the high churn_rate even though it has less customer
--while spain and france have same less churn_rate almost both have same churn_rate percentage  
--also france have the more customer than germany and spain but had less churn_rate 16.15




-- Credit score vs churnselect exited,
count(*) as num_customer,
round(avg(creditscore),2) as avg_creditscore
from customer
group by exited;

--the customer who already stop using the product his avg_creditscore is 645.35
--while the customer who has still using the product have high creditscore is 651.85
-- This suggests that credit score may have some association with churn,
-- although the difference is relatively small.






--which age group is mostly like to churn
select 
case
	when age<30 then 'Under-30'
	when age between 30 and 39 then '30-39'
	when age between 40 and 49 then '40-49'
	else '50+'
	end as age_group,
	count(*) as total_customer,
	sum(case when exited=1 then 1 else 0 end) as exited_customer,
round(sum(case when exited=1 then 1 else 0 end)*100.0 /count(*),2) as churn_rate
from customer 
group by age_group
order by churn_rate desc;

-- Customers aged 50+ have the highest churn rate.
-- Customers under 30 have the lowest churn rate, at around 7.56%.
-- This suggests that older customers are a higher-risk segment for churn.






-- Churn by number of products
select numofproducts,
count(*) as total_customer,
sum(case when exited=1 then 1 else 0 end) as exited_customer,
round(sum(case when exited=1 then 1 else 0 end)*100.0 /count(*),2) as churn_rate
from customer
group by numofproducts
order by churn_rate desc;

--The customer who already used all 4 products have the highest churn_Rate
--Total 60 customer used all 4 products all of them exited 
-- Customers with 1 or 2 products have comparatively lower churn rates.
-- The high churn among customers with 3 or 4 products should be
-- investigated further to understand the reason behind it.




-- Churn by active membership
select isactivemember,
case
    when isactivemember = 1 then 'Active'
    else 'Inactive' end as member_status,
count(*) as total_customer,
sum(case when exited=1 then 1 else 0 end) as exited_customer,
round(sum(case when exited=1 then 1 else 0 end)*100.0 /count(*),2) as churn_rate
from customer
group by isactivemember;

--The customer who is no longer active has the highest churn_rate of 26.85
-- Active customers have a lower churn rate.
-- This suggests that customer activity is associated with churn,
-- with inactive customers being a higher-risk segment.
