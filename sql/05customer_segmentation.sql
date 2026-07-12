--Add age
ALTER TABLE marketing_data
ADD COLUMN age INT;

UPDATE marketing_data
SET age = EXTRACT(YEAR FROM CURRENT_DATE) - year_birth;

--Add total_spend
ALTER TABLE marketing_data
ADD COLUMN total_spend NUMERIC(12,2);

UPDATE marketing_data
SET total_spend =
COALESCE(mntwines,0) +
COALESCE(mntfruits,0) +
COALESCE(mntmeatproducts,0) +
COALESCE(mntfishproducts,0) +
COALESCE(mntsweetproducts,0) +
COALESCE(mntgoldprods,0);

--Add total_purchases
ALTER TABLE marketing_data
ADD COLUMN total_purchases INT;

UPDATE marketing_data
SET total_purchases =
COALESCE(numwebpurchases,0) +
COALESCE(numcatalogpurchases,0) +
COALESCE(numstorepurchases,0);

--Add customer_segment
ALTER TABLE marketing_data
ADD COLUMN customer_segment VARCHAR(20);

UPDATE marketing_data
SET customer_segment =
CASE
    WHEN total_spend >= 2000 THEN 'High Value'
    WHEN total_spend >= 1000 THEN 'Medium Value'
    ELSE 'Low Value'
END;


--1. High / Medium / Low Value Customers
SELECT
id,
income,
total_spend,
CASE
WHEN total_spend>=2000 THEN 'High Value'
WHEN total_spend>=1000 THEN 'Medium Value'
ELSE 'Low Value'
END AS customer_segment
FROM marketing_data;

--2. Income Segmentation
SELECT
CASE
WHEN income<30000 THEN 'Low Income'
WHEN income BETWEEN 30000 AND 70000

THEN 'Middle Income'
ELSE 'High Income'
END income_group,
COUNT(*) customers,
ROUND(AVG(total_spend),2) avg_spend
FROM marketing_data
GROUP BY income_group;

--3. Family Type Analysis
SELECT
(kidhome+teenhome) children,
COUNT(*) customers,
ROUND(AVG(total_spend),2) avg_spend
FROM marketing_data
GROUP BY children
ORDER BY children;

--4. Campaign Response by Segment
SELECT
customer_segment,
COUNT(*) customers,
SUM(response) responses,
ROUND(AVG(response)*100,2) response_rate

FROM marketing_data
GROUP BY customer_segment;

--5. Highest Spending Age Groups
SELECT

CASE
WHEN age<30 THEN '18-29'
WHEN age BETWEEN 30 AND 45 THEN '30-45'
WHEN age BETWEEN 46 AND 60 THEN '46-60'

ELSE '60+'
END age_group,
ROUND(AVG(total_spend),2) avg_spending
FROM marketing_data
GROUP BY age_group
ORDER BY avg_spending DESC;

--6. Top 20 Valuable Customers
SELECT
id,
income,
total_spend,
customer_segment
FROM marketing_data
ORDER BY total_spend DESC
LIMIT 20;

--7. Loyal Customers
SELECT
id,
total_purchases,
total_spend
FROM marketing_data
WHERE total_purchases>=20
ORDER BY total_spend DESC;

--8. High Income but Low Spending
SELECT
id,
income,
total_spend
FROM marketing_data
WHERE income>80000
AND total_spend<500;