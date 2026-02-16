{{ config(materialized='view') }}

SELECT * FROM {{ source('myfirstschema', 'customer') }}
