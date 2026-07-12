--Here we are trying to undertsand
--Who are our best customers?

-- Top 20 Highest Spending Customers
SELECT
id,
income,
education,
total_spending
FROM marketing_clean
ORDER BY total_spending DESC
LIMIT 20;

-- Spending by Education
SELECT
education,
ROUND(AVG(total_spending),2) AS average_spending
FROM marketing_clean
GROUP BY education
ORDER BY average_spending DESC;

-- Spending by Marital Status
SELECT
marital_status,
ROUND(AVG(total_spending),2) AS average_spending
FROM marketing_clean
GROUP BY marital_status
ORDER BY average_spending DESC;

-- Top 10 Highest Income Customers
SELECT
id,
income
FROM marketing_clean
ORDER BY income DESC
LIMIT 10;

-- Average Spending by Age Group
SELECT
CASE
    WHEN age <30 THEN '18-29'
    WHEN age <40 THEN '30-39'
    WHEN age <50 THEN '40-49'
    WHEN age <60 THEN '50-59'
    ELSE '60+'
END AS age_group,
ROUND(AVG(total_spending),2) AS avg_spending
FROM marketing_clean
GROUP BY age_group
ORDER BY age_group;