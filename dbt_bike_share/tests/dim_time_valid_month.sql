-- Test that month values are valid
{{ config(severity='error') }}
SELECT
    *
FROM {{ ref('dim_time') }}
WHERE month < 1 OR month > 12

