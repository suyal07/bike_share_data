{{ config(materialized='view') }}

WITH source AS (
    SELECT DISTINCT
        "User Type" AS user_type,
        "Birth Year" AS birth_year,
        "Gender" AS gender
    FROM {{ source('raw', 'raw_rides') }}
    WHERE "User Type" IS NOT NULL
)

SELECT
    user_type,
    CAST(birth_year AS INTEGER) AS birth_year,
    CASE
        WHEN gender = 0 THEN 'Unknown'
        WHEN gender = 1 THEN 'Male'
        WHEN gender = 2 THEN 'Female'
        ELSE 'Other'
    END AS gender,
    {{ calculate_age('birth_year') }} AS age
FROM source
