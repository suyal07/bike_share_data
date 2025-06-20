
  create view "C:\Users\Parth Suyal\Desktop\bike_share_analysis\dbt_bike_share\bike_share.db"."main"."stg_stations__dbt_tmp" as (
    

WITH start_stations AS (
    SELECT DISTINCT
        CAST("Start Station ID" AS INTEGER) AS station_id,
        "Start Station Name" AS station_name,
        CAST("Start Station Latitude" AS FLOAT) AS latitude,
        CAST("Start Station Longitude" AS FLOAT) AS longitude
    FROM "C:\Users\Parth Suyal\Desktop\bike_share_analysis\dbt_bike_share\bike_share.db"."main"."raw_rides"
    WHERE "Start Station ID" IS NOT NULL
),

end_stations AS (
    SELECT DISTINCT
        CAST("End Station ID" AS INTEGER) AS station_id,
        "End Station Name" AS station_name,
        CAST("End Station Latitude" AS FLOAT) AS latitude,
        CAST("End Station Longitude" AS FLOAT) AS longitude
    FROM "C:\Users\Parth Suyal\Desktop\bike_share_analysis\dbt_bike_share\bike_share.db"."main"."raw_rides"
    WHERE "End Station ID" IS NOT NULL
)

SELECT DISTINCT
    station_id,
    station_name,
    latitude,
    longitude
FROM (
    SELECT * FROM start_stations
    UNION ALL
    SELECT * FROM end_stations
) AS combined_stations
WHERE station_id IS NOT NULL
GROUP BY station_id, station_name, latitude, longitude
  );
