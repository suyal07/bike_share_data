-- Test that trip_duration_in_min is always positive

SELECT
    *
FROM "bike_share"."main"."stg_rides"
WHERE trip_duration_in_min <= 0