-- Test that station_id is not null
{{ config(severity='error') }}
SELECT
    *
FROM {{ ref('dim_stations') }}
WHERE station_id IS NULL

