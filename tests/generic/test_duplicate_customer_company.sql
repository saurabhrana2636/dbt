{% test test_duplicate_customer_company(model) %}

SELECT
    CUSTOMER_ID,
    COMPANY_ID,
    COUNT(*) AS record_count
FROM {{ model }}
GROUP BY CUSTOMER_ID, COMPANY_ID
HAVING COUNT(*) > 1
{% endtest %}
