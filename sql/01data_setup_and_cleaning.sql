CREATE TABLE marketing_data (
    id INT PRIMARY KEY,
    year_birth INT,
    education VARCHAR(50),
    marital_status VARCHAR(50),
    income NUMERIC,
    kidhome INT,
    teenhome INT,
    dt_customer DATE,
    recency INT,
    mntwines NUMERIC,
    mntfruits NUMERIC,
    mntmeatproducts NUMERIC,
    mntfishproducts NUMERIC,
    mntsweetproducts NUMERIC,
    mntgoldprods NUMERIC,
    numdealspurchases INT,
    numwebpurchases INT,
    numcatalogpurchases INT,
    numstorepurchases INT,
    numwebvisitsmonth INT,
    acceptedcmp3 INT,
    acceptedcmp4 INT,
    acceptedcmp5 INT,
    acceptedcmp1 INT,
    acceptedcmp2 INT,
    complain INT,
    z_costcontact INT,
    z_revenue INT,
    response INT
);

SELECT COUNT(*)
FROM marketing_data;

SELECT *
FROM marketing_data
LIMIT 5;

SELECT COUNT(*) AS missing_income
FROM marketing_data
WHERE income IS NULL;

SELECT id, COUNT(*)
FROM marketing_data
GROUP BY id
HAVING COUNT(*) > 1;

SELECT
    MIN(income) AS min_income,
    MAX(income) AS max_income,
    ROUND(AVG(income),2) AS avg_income
FROM marketing_data;

SELECT
    education,
    COUNT(*) AS customers
FROM marketing_data
GROUP BY education
ORDER BY customers DESC;

SELECT
    marital_status,
    COUNT(*) AS customers
FROM marketing_data
GROUP BY marital_status
ORDER BY customers DESC;


CREATE TABLE marketing_clean AS
SELECT
    *,
    EXTRACT(YEAR FROM CURRENT_DATE) - year_birth AS age,

    (mntwines + mntfruits + mntmeatproducts +
     mntfishproducts + mntsweetproducts + mntgoldprods) AS total_spending,

    (numwebpurchases + numcatalogpurchases + numstorepurchases) AS total_purchases,

    (kidhome + teenhome) AS total_children

FROM marketing_data
WHERE income IS NOT NULL;

SELECT COUNT(*)
FROM marketing_clean;