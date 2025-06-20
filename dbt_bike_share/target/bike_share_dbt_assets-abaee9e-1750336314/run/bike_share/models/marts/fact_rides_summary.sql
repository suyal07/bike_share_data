
  
    

    create  table
      "bike_share"."main"."fact_rides_summary__dbt_tmp"
    as (
      

WITH user_dims AS (
    SELECT
        user_key,
        user_type,
        gender,
        age_group
    FROM "bike_share"."main"."dim_users"
),

time_dims AS (
    SELECT
        time_key,
        date,
        month,
        year,
        day_of_week,
        is_weekend,
        time_of_day
    FROM "bike_share"."main"."dim_time"
),

ride_metrics AS (
    SELECT
        date,
        start_station_id,
        end_station_id,
        bike_id,
        user_type,
        gender,
        age,
        route_id,
        COUNT(*) AS ride_count,
        AVG(trip_duration_in_min) AS avg_trip_duration_min,
        MAX(trip_duration_in_min) AS max_trip_duration_min,
        MIN(trip_duration_in_min) AS min_trip_duration_min,
        time_of_day,
        day_of_week,
        is_weekend,
        month
    FROM "bike_share"."main"."int_rides_enriched"
    GROUP BY
        date,
        start_station_id,
        end_station_id,
        bike_id,
        user_type,
        gender,
        age,
        route_id,
        time_of_day,
        day_of_week,
        is_weekend,
        month
)

SELECT
    rm.date,
    rm.start_station_id,
    rm.end_station_id,
    rm.bike_id,
    u.user_key,
    t.time_key,
    rm.route_id,
    rm.ride_count,
    rm.avg_trip_duration_min,
    rm.max_trip_duration_min,
    rm.min_trip_duration_min,
    rm.time_of_day,
    rm.day_of_week,
    rm.is_weekend,
    rm.month
FROM ride_metrics rm
LEFT JOIN user_dims u
    ON rm.user_type = u.user_type
    AND rm.gender = u.gender
    AND CASE 
        WHEN rm.age < 18 THEN 'Under 18'
        WHEN rm.age BETWEEN 18 AND 24 THEN '18-24'
        WHEN rm.age BETWEEN 25 AND 34 THEN '25-34'
        WHEN rm.age BETWEEN 35 AND 44 THEN '35-44'
        WHEN rm.age BETWEEN 45 AND 54 THEN '45-54'
        WHEN rm.age BETWEEN 55 AND 64 THEN '55-64'
        WHEN rm.age >= 65 THEN '65+'
        ELSE 'Unknown'
    END = u.age_group
LEFT JOIN time_dims t
    ON rm.date = t.date
    AND rm.time_of_day = t.time_of_day
    );
  