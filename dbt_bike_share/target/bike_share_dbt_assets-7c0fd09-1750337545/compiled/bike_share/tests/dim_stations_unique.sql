-- Test that station_id is unique

SELECT
    station_id,
    COUNT(*) AS count
FROM "bike_share"."main"."dim_stations"
GROUP BY station_id
HAVING COUNT(*) > 1