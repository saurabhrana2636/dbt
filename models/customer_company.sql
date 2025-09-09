{{ config(materialized='view') }}

WITH customer_data AS (
    SELECT *
    FROM {{ source('myfirstschema', 'customer') }}
),

company_data AS (
    SELECT *
    FROM {{ source('myfirstschema', 'company') }}
)

SELECT
    c.COMPANY_ID,
    c.COMPANY_NAME,
    c.INDUSTRY,
    c.CITY AS COMPANY_CITY,
    c.COUNTRY AS COMPANY_COUNTRY,
    c.CREATED_AT AS COMPANY_CREATED_AT,
    cust.CUSTOMER_ID,
    cust.FIRST_NAME || ' ' || cust.LAST_NAME AS CUSTOMER_NAME,
    cust.EMAIL,
    cust.PHONE,
    cust.CITY AS CUSTOMER_CITY,
    cust.COUNTRY AS CUSTOMER_COUNTRY,
    cust.CREATED_AT AS CUSTOMER_CREATED_AT
FROM company_data c
LEFT JOIN customer_data cust
    ON c.CUSTOMER_ID = cust.CUSTOMER_ID
