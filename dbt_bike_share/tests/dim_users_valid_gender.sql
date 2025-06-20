-- Test that gender values are valid
{{ config(severity='error') }}
SELECT
    *
FROM {{ ref('dim_users') }}
WHERE gender NOT IN ('Male', 'Female', 'Unknown', 'Other')

