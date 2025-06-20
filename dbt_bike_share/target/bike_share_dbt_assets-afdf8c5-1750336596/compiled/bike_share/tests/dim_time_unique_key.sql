-- Test that time_key is unique

SELECT
    time_key,
    COUNT(*) AS count
FROM "bike_share"."main"."dim_time"
GROUP BY time_key
HAVING COUNT(*) > 1