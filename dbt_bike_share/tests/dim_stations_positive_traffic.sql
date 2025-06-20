-- Test that traffic statistics are not negative
{{ config(severity='error') }}
SELECT
    *
FROM {{ ref('dim_stations') }}
WHERE 
    start_count < 0 OR 
    end_count < 0 OR 
    total_traffic < 0

