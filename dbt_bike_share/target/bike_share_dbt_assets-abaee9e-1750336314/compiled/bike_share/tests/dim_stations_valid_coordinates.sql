-- Test that station coordinates are valid

SELECT
    *
FROM "bike_share"."main"."dim_stations"
WHERE 
    latitude < -90 OR latitude > 90 OR
    longitude < -180 OR longitude > 180