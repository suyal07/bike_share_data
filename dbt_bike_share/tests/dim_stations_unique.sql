-- Test that station_id is unique
{{ config(severity='error') }}
SELECT
    station_id,
    COUNT(*) AS count
FROM {{ ref('dim_stations') }}
GROUP BY station_id
HAVING COUNT(*) > 1

