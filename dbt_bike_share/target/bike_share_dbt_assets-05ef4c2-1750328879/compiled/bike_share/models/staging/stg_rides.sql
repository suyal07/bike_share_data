

WITH source AS (
    SELECT * FROM "dbt_bike_share/bike_share.db"."main"."raw_rides"
)

SELECT
    CAST("Trip Duration" AS INTEGER) AS trip_duration,
    CAST("Start Time" AS TIMESTAMP) AS start_time,
    CAST("Stop Time" AS TIMESTAMP) AS stop_time,
    CAST("Start Station ID" AS INTEGER) AS start_station_id,
    "Start Station Name" AS start_station_name,
    CAST("Start Station Latitude" AS FLOAT) AS start_station_latitude,
    CAST("Start Station Longitude" AS FLOAT) AS start_station_longitude,
    CAST("End Station ID" AS INTEGER) AS end_station_id,
    "End Station Name" AS end_station_name,
    CAST("End Station Latitude" AS FLOAT) AS end_station_latitude,
    CAST("End Station Longitude" AS FLOAT) AS end_station_longitude,
    CAST("Bike ID" AS INTEGER) AS bike_id,
    "User Type" AS user_type,
    CAST("Birth Year" AS INTEGER) AS birth_year,
    CAST("Gender" AS INTEGER) AS gender,
    CAST("Trip_Duration_in_min" AS INTEGER) AS trip_duration_in_min
FROM source