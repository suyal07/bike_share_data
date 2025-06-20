{{ config(materialized='table') }}

SELECT
    station_id,
    station_name,
    latitude,
    longitude,
    start_count,
    end_count,
    total_traffic,
    net_flow
FROM {{ ref('int_stations') }}
