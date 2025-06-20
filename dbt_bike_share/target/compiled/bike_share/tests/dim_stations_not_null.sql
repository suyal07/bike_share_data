-- Test that station_id is not null

SELECT
    *
FROM "bike_share"."main"."dim_stations"
WHERE station_id IS NULL