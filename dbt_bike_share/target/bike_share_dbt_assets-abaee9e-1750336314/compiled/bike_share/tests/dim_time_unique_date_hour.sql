-- Test that date is unique (for combinations of date and hour)

SELECT
    date, hour,
    COUNT(*) AS count
FROM "bike_share"."main"."dim_time"
GROUP BY date, hour
HAVING COUNT(*) > 1