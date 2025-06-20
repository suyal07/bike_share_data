-- Test that start_time is before stop_time

SELECT
    *
FROM "bike_share"."main"."stg_rides"
WHERE start_time >= stop_time