

WITH validation AS (
    SELECT
        trip_duration AS value
    FROM "bike_share"."main"."stg_rides"
)

SELECT
    *
FROM validation
WHERE value <= 0 OR value IS NULL

