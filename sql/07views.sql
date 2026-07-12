-- Create customer summary view
CREATE VIEW vw_customer_summary AS
SELECT
    id,
    age,
    education,
    marital_status,
    income,
    total_spend,
    total_purchases,
    customer_segment,
    response
FROM marketing_data;

-- View customer summary
SELECT *
FROM vw_customer_summary;


-- Create purchase summary view
CREATE VIEW vw_purchase_summary AS
SELECT
    id,
    total_spend,
    total_purchases,
    numwebpurchases,
    numcatalogpurchases,
    numstorepurchases,
    numdealspurchases
FROM marketing_data;

-- View purchase summary
SELECT *
FROM vw_purchase_summary;

-- Create campaign summary view
CREATE VIEW vw_campaign_summary AS
SELECT
    id,
    acceptedcmp1,
    acceptedcmp2,
    acceptedcmp3,
    acceptedcmp4,
    acceptedcmp5,
    response,
    complain
FROM marketing_data;

-- View campaign summary
SELECT *
FROM vw_campaign_summary;

-- Create customer demographics view
CREATE VIEW vw_customer_demographics AS
SELECT
    id,
    age,
    education,
    marital_status,
    kidhome,
    teenhome,
    income
FROM marketing_data;

-- View customer demographics
SELECT *
FROM vw_customer_demographics;

-- Create online shopping view
CREATE VIEW vw_online_customers AS
SELECT
    id,
    income,
    numwebpurchases,
    numwebvisitsmonth,
    total_spend
FROM marketing_data
WHERE numwebpurchases >
      numstorepurchases
AND numwebpurchases >
      numcatalogpurchases;

-- View online customers
SELECT *
FROM vw_online_customers;

-- Create high-value customer view
CREATE VIEW vw_high_value_customers AS
SELECT
    id,
    income,
    total_spend,
    total_purchases,
    customer_segment
FROM marketing_data
WHERE customer_segment = 'High Value';