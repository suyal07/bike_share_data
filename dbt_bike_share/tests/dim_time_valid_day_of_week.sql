-- Test that day_of_week values are valid
{{ config(severity='error') }}
SELECT
    *
FROM {{ ref('dim_time') }}
WHERE day_of_week < 0 OR day_of_week > 6

