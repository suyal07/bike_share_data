-- Test that date is unique (for combinations of date and hour)
{{ config(severity='error') }}
SELECT
    date, hour,
    COUNT(*) AS count
FROM {{ ref('dim_time') }}
GROUP BY date, hour
HAVING COUNT(*) > 1

