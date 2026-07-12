--1. Total Spending per Customer
SELECT
    id,
    education,
    marital_status,
    income,

    (mntwines +
     mntfruits +
     mntmeatproducts +
     mntfishproducts +
     mntsweetproducts +
     mntgoldprods) AS total_spend

FROM marketing_data
ORDER BY total_spend DESC;

--2. Average Spending by Education
SELECT
    education,

    ROUND(AVG(
        mntwines +
        mntfruits +
        mntmeatproducts +
        mntfishproducts +
        mntsweetproducts +
        mntgoldprods
    ),2) AS avg_spending

FROM marketing_data

GROUP BY education

ORDER BY avg_spending DESC;


--3. Favorite Product Category
SELECT
'Wine' AS product,
SUM(mntwines) revenue

FROM marketing_data

UNION ALL

SELECT
'Fruits',
SUM(mntfruits)

FROM marketing_data

UNION ALL

SELECT
'Meat',
SUM(mntmeatproducts)

FROM marketing_data

UNION ALL

SELECT
'Fish',
SUM(mntfishproducts)

FROM marketing_data

UNION ALL

SELECT
'Sweets',
SUM(mntsweetproducts)

FROM marketing_data

UNION ALL

SELECT
'Gold',
SUM(mntgoldprods)
FROM marketing_data
ORDER BY revenue DESC;

--4. Purchase Channel Preference
SELECT

SUM(numwebpurchases) AS web,

SUM(numcatalogpurchases) AS catalog,

SUM(numstorepurchases) AS store
FROM marketing_data;

--5. Average Website Visits
SELECT

ROUND(AVG(numwebvisitsmonth),2) AS avg_web_visits
FROM marketing_data;

--6. Customers Browsing but Not Buying
SELECT

id,

numwebvisitsmonth,

numwebpurchases

FROM marketing_data
WHERE numwebvisitsmonth>=10
AND numwebpurchases<=1;


--7. Deal Hunters
SELECT
id,
numdealspurchases,
income
FROM marketing_data
ORDER BY numdealspurchases DESC;

--8. Online vs Offline Customers
SELECT
CASE
WHEN numwebpurchases >
(numstorepurchases + numcatalogpurchases)

THEN 'Online Shopper'
ELSE 'Offline Shopper'
END AS purchase_type,
COUNT(*) customers
FROM marketing_data
GROUP BY purchase_type;