-- Test that start_time is before stop_time
{{ config(severity='warn') }}
SELECT
    *
FROM {{ ref('stg_rides') }}
WHERE start_time >= stop_time

