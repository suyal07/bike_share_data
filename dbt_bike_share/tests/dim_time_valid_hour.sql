-- Test that hour values are valid
{{ config(severity='error') }}
SELECT
    *
FROM {{ ref('dim_time') }}
WHERE hour < 0 OR hour > 23

