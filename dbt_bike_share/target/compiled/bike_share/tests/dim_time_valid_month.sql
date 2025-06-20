-- Test that month values are valid

SELECT
    *
FROM "bike_share"."main"."dim_time"
WHERE month < 1 OR month > 12