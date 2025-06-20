-- Test that trip_duration_in_min is always positive
{{ config(severity='error') }}
SELECT
    *
FROM {{ ref('stg_rides') }}
WHERE trip_duration_in_min <= 0

