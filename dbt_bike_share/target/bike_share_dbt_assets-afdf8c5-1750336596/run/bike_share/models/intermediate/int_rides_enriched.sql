
  
    

    create  table
      "bike_share"."main"."int_rides_enriched__dbt_tmp"
    as (
      

WITH rides_with_stations AS (
    SELECT
        r.trip_duration,
        r.start_time,
        r.stop_time,
        r.start_station_id,
        ss.station_name AS start_station_name,
        ss.latitude AS start_station_latitude,
        ss.longitude AS start_station_longitude,
        r.end_station_id,
        es.station_name AS end_station_name,
        es.latitude AS end_station_latitude,
        es.longitude AS end_station_longitude,
        r.bike_id,
        r.user_type,
        r.birth_year,
        u.gender,
        r.trip_duration_in_min,
        t.date,
        t.hour,
        t.day_of_week,
        t.month,
        t.year,
        t.is_weekend,
        t.time_of_day,
        t.day_name,
        t.month_name,
        
    CASE
        WHEN r.birth_year IS NULL OR r.birth_year = 0 THEN NULL
        ELSE DATE_PART('year', CURRENT_DATE()) - r.birth_year
    END
 AS age
    FROM "bike_share"."main"."stg_rides" r
    LEFT JOIN "bike_share"."main"."stg_stations" ss
        ON r.start_station_id = ss.station_id
    LEFT JOIN "bike_share"."main"."stg_stations" es
        ON r.end_station_id = es.station_id
    LEFT JOIN "bike_share"."main"."stg_users" u
        ON r.user_type = u.user_type AND r.birth_year = u.birth_year
    LEFT JOIN "bike_share"."main"."int_time" t
        ON CAST(r.start_time AS DATE) = t.date
)

SELECT
    trip_duration,
    start_time,
    stop_time,
    start_station_id,
    start_station_name,
    start_station_latitude,
    start_station_longitude,
    end_station_id,
    end_station_name,
    end_station_latitude,
    end_station_longitude,
    bike_id,
    user_type,
    birth_year,
    gender,
    trip_duration_in_min,
    date,
    hour,
    day_of_week,
    month,
    year,
    is_weekend,
    time_of_day,
    day_name,
    month_name,
    age,
    CONCAT(start_station_id, '-', end_station_id) AS route_id
FROM rides_with_stations
    );
  