-- Test that station coordinates are valid
{{ config(severity='error') }}
SELECT
    *
FROM {{ ref('dim_stations') }}
WHERE 
    latitude < -90 OR latitude > 90 OR
    longitude < -180 OR longitude > 180

