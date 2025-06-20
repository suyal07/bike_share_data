{{ config(materialized='table') }}

WITH station_stats AS (
    SELECT
        s.station_id,
        s.station_name,
        s.latitude,
        s.longitude,
        COUNT(CASE WHEN r.start_station_id = s.station_id THEN 1 END) AS start_count,
        COUNT(CASE WHEN r.end_station_id = s.station_id THEN 1 END) AS end_count
    FROM {{ ref('stg_stations') }} s
    LEFT JOIN {{ ref('stg_rides') }} r
        ON s.station_id = r.start_station_id OR s.station_id = r.end_station_id
    GROUP BY s.station_id, s.station_name, s.latitude, s.longitude
)

SELECT
    station_id,
    station_name,
    latitude,
    longitude,
    start_count,
    end_count,
    (start_count + end_count) AS total_traffic,
    (start_count - end_count) AS net_flow
FROM station_stats
