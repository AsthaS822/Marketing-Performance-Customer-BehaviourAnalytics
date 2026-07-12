
--Dataset Overview

--To Total Customers
SELECT COUNT(*) AS total_customers
FROM marketing_clean;

-- calculating Average Income
SELECT ROUND(AVG(income),2) AS average_income
FROM marketing_clean;

--calculating Income Statistics
SELECT
MIN(income) AS minimum_income,
MAX(income) AS maximum_income,
ROUND(AVG(income),2) AS average_income
FROM marketing_clean;


--Customer Demographics

-- Educational Distribution
SELECT
education,
COUNT(*) AS customers
FROM marketing_clean
GROUP BY education
ORDER BY customers DESC;

-- Marital Status Distribution
SELECT
marital_status,
COUNT(*) AS customers
FROM marketing_clean
GROUP BY marital_status
ORDER BY customers DESC;

-- calculating Age Statistics
SELECT
MIN(age),
MAX(age),
ROUND(AVG(age),2)
FROM marketing_clean;

-- seeing Age Group Distribution
SELECT
CASE
    WHEN age < 30 THEN '18-29'
    WHEN age < 40 THEN '30-39'
    WHEN age < 50 THEN '40-49'
    WHEN age < 60 THEN '50-59'
    ELSE '60+'
END AS age_group,
COUNT(*) AS customers
FROM marketing_clean
GROUP BY age_group
ORDER BY age_group;

--Spending Overview

SELECT
ROUND(AVG(total_spending),2) AS average_spending,
MIN(total_spending) AS minimum_spending,
MAX(total_spending) AS maximum_spending
FROM marketing_clean;

SELECT
ROUND(AVG(total_purchases),2) AS average_purchases
FROM marketing_clean;