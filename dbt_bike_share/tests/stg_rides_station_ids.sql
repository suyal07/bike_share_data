-- Test that all rides have station IDs
{{ config(severity='error') }}
SELECT
    *
FROM {{ ref('stg_rides') }}
WHERE start_station_id IS NULL OR end_station_id IS NULL

