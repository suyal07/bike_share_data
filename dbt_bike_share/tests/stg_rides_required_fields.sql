-- Schema test for required fields
{{ config(severity='error') }}
SELECT *
FROM {{ ref('stg_rides') }}
WHERE 
    trip_duration IS NULL
    OR start_time IS NULL
    OR start_station_id IS NULL
    OR bike_id IS NULL

