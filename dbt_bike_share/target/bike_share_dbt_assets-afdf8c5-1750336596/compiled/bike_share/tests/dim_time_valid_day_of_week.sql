-- Test that day_of_week values are valid

SELECT
    *
FROM "bike_share"."main"."dim_time"
WHERE day_of_week < 0 OR day_of_week > 6