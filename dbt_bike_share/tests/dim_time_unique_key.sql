-- Test that time_key is unique
{{ config(severity='error') }}
SELECT
    time_key,
    COUNT(*) AS count
FROM {{ ref('dim_time') }}
GROUP BY time_key
HAVING COUNT(*) > 1

