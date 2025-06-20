-- Test that hour values are valid

SELECT
    *
FROM "bike_share"."main"."dim_time"
WHERE hour < 0 OR hour > 23