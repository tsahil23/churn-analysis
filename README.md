# Customer Churn 

## 📌 Overview
This dataset contains information about 10,000 bank customers along with their personal, financial, and banking-related details. 
The Exited column indicates whether a customer has left the bank or is still a customer.

The dataset is useful for analyzing customer churn and retention. 
It helps identify patterns and customer segments that are more likely to leave the bank based on factors such as age, gender, location, credit score, tenure, number of products, account balance, and membership activity.

📊 Dashboard Preview
<img width="1378" height="772" alt="image" src="https://github.com/user-attachments/assets/93bbdb6e-868c-4f68-8d04-d36975a2eeaa" />


## 🔄 Project Workflow

**1. Kaggle Dataset**
Download the banking customer churn dataset.
↓
**2. Load Data into PostgreSQL**
Create the customer table and import the CSV data into PostgreSQL.
↓
**3. Data Validation**
Check the data structure, row count, NULL values, and data quality.
↓
**4. SQL Analysis**
Analyze churn rate based on gender, age, geography, tenure, credit score, products, and active membership.
↓
**5. Power BI Dashboard**
Connect PostgreSQL to Power BI and create interactive charts, KPIs, 
↓
**6. Insights & Recommendations**
Identify high-risk customer segments and suggest strategies to reduce churn.

## 🛠️ Tools Used

- Kaggle Dataset
- Excel / CSV
- PostgreSQL
- Power BI

## 📊 Key KPIs

- **Total Customers:** 10,000
- **Churned Customers:** 2,037
- **Overall Churn Rate:** 20.37%

## 🔍 Key Insights

- Female customers have a higher churn rate than male customers.
- Germany has the highest churn rate among the countries.
- Customers aged **50+** have the highest churn rate.
- Inactive customers have a higher churn rate than active customers.
- Customers using **4 products** have an extremely high churn rate.
- Churned customers have a slightly lower average credit score than retained customers.

## 📈 Dashboard

The Power BI dashboard includes:

- Overall Churn Rate
- Churn by Gender
- Churn by Country
- Churn by Age Group
- Churn by Products
- Churn by Tenure
- Churn by Balance Group

## Churn Reduction Recommendations
- Re-engage Inactive Customers
Contact inactive customers with offers and reminders to encourage them to stay with the bank.
- Focus on German Customers
Germany has the highest churn rate. The bank should find the reasons and provide better support and offers.
- Target Customers Aged 50+
Provide better support, loyalty benefits, and personalized services to older customers.
- Check Customers with Multiple Products
Customers with 3–4 products have very high churn. The bank should find out why they are leaving and improve their experience.
- Focus on Female Customers
Female customers have a higher churn rate. The bank should understand their needs and provide suitable services and offers.
- Use Tenure-Based Campaigns
Identify the tenure periods with high churn and offer special benefits to customers during those periods.



