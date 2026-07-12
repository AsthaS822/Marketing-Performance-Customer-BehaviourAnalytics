-- Rank customers by yearly income
SELECT
    id,
    income,
    RANK() OVER (ORDER BY income DESC) AS income_rank
FROM marketing_data
WHERE income IS NOT NULL;


-- Dense rank customers by income
SELECT
    id,
    income,
    DENSE_RANK() OVER (ORDER BY income DESC) AS dense_rank
FROM marketing_data
WHERE income IS NOT NULL;


-- Assign row numbers to customers
SELECT
    id,
    income,
    ROW_NUMBER() OVER (ORDER BY income DESC) AS row_number
FROM marketing_data
WHERE income IS NOT NULL;


-- Compare each customer's income with the previous customer
SELECT
    id,
    income,
    LAG(income) OVER (ORDER BY income) AS previous_income
FROM marketing_data
WHERE income IS NOT NULL;


-- Compare each customer's income with the next customer
SELECT
    id,
    income,
    LEAD(income) OVER (ORDER BY income) AS next_income
FROM marketing_data
WHERE income IS NOT NULL;


-- Divide customers into four income groups
SELECT
    id,
    income,
    NTILE(4) OVER (ORDER BY income) AS income_quartile
FROM marketing_data
WHERE income IS NOT NULL;


-- Calculate average income for each education level
SELECT
    id,
    education,
    income,
    ROUND(
        AVG(income) OVER (PARTITION BY education),
        2
    ) AS avg_income
FROM marketing_data
WHERE income IS NOT NULL;


-- Find top 3 customers by income in each education group
WITH ranked_customers AS
(
    SELECT
        id,
        education,
        income,
        ROW_NUMBER() OVER
        (
            PARTITION BY education
            ORDER BY income DESC
        ) AS rn
    FROM marketing_data
    WHERE income IS NOT NULL
)

SELECT *
FROM ranked_customers
WHERE rn <= 3;


-- Find customers earning above their education group's average
SELECT
    m1.id,
    m1.education,
    m1.income
FROM marketing_data m1
WHERE m1.income IS NOT NULL
AND m1.income >
(
    SELECT AVG(m2.income)
    FROM marketing_data m2
    WHERE m2.education = m1.education
);


-- Calculate median income
SELECT
    PERCENTILE_CONT(0.50)
    WITHIN GROUP (ORDER BY income) AS median_income
FROM marketing_data
WHERE income IS NOT NULL;


-- Calculate 90th percentile income
SELECT
    PERCENTILE_CONT(0.90)
    WITHIN GROUP (ORDER BY income) AS percentile_90
FROM marketing_data
WHERE income IS NOT NULL;


-- Calculate running total of income
SELECT
    id,
    income,
    SUM(income) OVER (ORDER BY income) AS running_income
FROM marketing_data
WHERE income IS NOT NULL;


-- Calculate running average of income
SELECT
    id,
    income,
    ROUND(
        AVG(income) OVER (ORDER BY income),
        2
    ) AS running_average
FROM marketing_data
WHERE income IS NOT NULL;

-- Calculate percent rank based on income
SELECT
    id,
    income,
    ROUND(
        (PERCENT_RANK() OVER (ORDER BY income))::numeric,
        4
    ) AS percent_rank
FROM marketing_data
WHERE income IS NOT NULL;


-- Compare each customer with the highest income
SELECT
    id,
    income,
    FIRST_VALUE(income) OVER (
        ORDER BY income DESC
    ) AS highest_income
FROM marketing_data
WHERE income IS NOT NULL;


-- Compare each customer with the lowest income
SELECT
    id,
    income,
    LAST_VALUE(income) OVER (
        ORDER BY income
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND UNBOUNDED FOLLOWING
    ) AS lowest_income
FROM marketing_data
WHERE income IS NOT NULL;


-- Calculate cumulative income distribution
SELECT
    id,
    income,
    ROUND(
        (CUME_DIST() OVER (ORDER BY income))::numeric,
        4
    ) AS cumulative_distribution
FROM marketing_data
WHERE income IS NOT NULL;


-- Find customers who accepted at least one campaign
SELECT
    id,
    income,
    acceptedcmp1,
    acceptedcmp2,
    acceptedcmp3,
    acceptedcmp4,
    acceptedcmp5
FROM marketing_data
WHERE acceptedcmp1 = 1
   OR acceptedcmp2 = 1
   OR acceptedcmp3 = 1
   OR acceptedcmp4 = 1
   OR acceptedcmp5 = 1;