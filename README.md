# 📊 Marketing Customer Analytics | SQL, Python & Tableau

## Project Overview

This project analyzes customer demographics, purchasing behavior, and marketing campaign performance using the Marketing Campaign dataset. The objective is to understand customer spending patterns, identify valuable customer segments, and generate business insights that can support more effective marketing strategies.

The project combines **SQL** for data preparation and business analysis, **Python** for feature engineering and exploratory data analysis (EDA), and **Tableau** for interactive dashboard visualization.

---

## Business Objectives

The analysis aims to answer several key business questions:

* Who are the company's highest-value customers?
* Which products contribute the most to customer spending?
* How do purchasing behaviors differ across customer segments?
* Which purchase channels (Web, Store, Catalog) are most frequently used?
* How effective are previous marketing campaigns?
* How can customer segmentation improve marketing decisions?

---

## Dataset

The dataset contains **2,240 customer records** and **29 attributes**, including:

* Customer demographics (Age, Education, Marital Status, Income)
* Household information
* Product spending across six product categories
* Purchase channels (Web, Store, Catalog)
* Marketing campaign responses
* Customer complaints
* Recency of purchases

---

## Tools & Technologies

* **SQL** – Data cleaning, transformation, analysis, window functions and views
* **Python** – Pandas, Matplotlib and Seaborn for EDA and feature engineering
* **Tableau** – Interactive dashboard development
* **Git & GitHub** – Version control and project documentation

---

## Project Workflow

### 1. Data Preparation (SQL)

* Created the marketing database and imported the dataset
* Cleaned and validated the data
* Handled missing values
* Created calculated fields for analysis

### 2. Exploratory Data Analysis (SQL)

Performed SQL analysis to understand:

* Customer demographics
* Income distribution
* Product spending
* Purchase channels
* Campaign responses

### 3. Customer Analysis

Analyzed:

* Top spending customers
* Spending by education
* Spending by marital status
* Customer response patterns

### 4. Purchase Behaviour Analysis

Evaluated:

* Total customer spending
* Purchase frequency
* Web vs Store vs Catalog purchases
* Product category performance

### 5. Customer Segmentation

Created new business features including:

* Age
* Total Spend
* Total Purchases
* Customer Segment (Low, Medium and High Value)

### 6. Advanced SQL

Applied advanced SQL concepts including:

* Common Table Expressions (CTEs)
* Window Functions
* RANK()
* DENSE_RANK()
* ROW_NUMBER()
* CASE statements
* Views

### 7. Python Analysis

Performed:

* Data quality checks
* Feature engineering
* Exploratory data analysis
* Customer demographic analysis
* Spending analysis
* Purchase behaviour visualization
* Correlation analysis

### 8. Tableau Dashboard

The final dashboard presents interactive visualizations for:

* Customer demographics
* Customer segments
* Spending analysis
* Purchase behaviour
* Campaign performance
* Key business KPIs

---

## Repository Structure

```text
Marketing-Customer-Analytics/
│
├── Dataset/
│   └── marketing_campaign.csv
│
├── SQL/
│   ├── 01data_setup_and_cleaning.sql
│   ├── 02exploratory_data_analysis.sql
│   ├── 03customer_analysis.sql
│   ├── 04purchase_behavior_analysis.sql
│   ├── 05customer_segmentation.sql
│   ├── 06advanced_sql.sql
│   ├── 07views.sql
│   └── 08views.sql
│
├── Python/
│   └── Marketing_analytics_insights.ipynb
│
├── Tableau/
│   └── Dashboard.twbx
│
└── README.md
```

---

## Key Skills Demonstrated

* SQL
* Advanced SQL
* Data Cleaning
* Exploratory Data Analysis (EDA)
* Customer Segmentation
* Purchase Behaviour Analysis
* Feature Engineering
* Window Functions
* Data Visualization
* Tableau Dashboard Development
* Business Insight Generation

---

## Project Outcome

This project demonstrates an end-to-end marketing analytics workflow, transforming raw customer data into meaningful business insights. The combination of SQL, Python, and Tableau provides a practical approach to customer segmentation, purchase behaviour analysis, and marketing performance evaluation while showcasing skills commonly used in real-world data analytics projects.

