
  
    

    create  table
      "bike_share"."main"."int_time__dbt_tmp"
    as (
      

WITH time_data AS (
    SELECT DISTINCT
        start_time::DATE AS date,
        EXTRACT(YEAR FROM start_time) AS year,
        EXTRACT(MONTH FROM start_time) AS month,
        EXTRACT(DAY FROM start_time) AS day,
        EXTRACT(DOW FROM start_time) AS day_of_week,
        EXTRACT(HOUR FROM start_time) AS hour,
        EXTRACT(QUARTER FROM start_time) AS quarter,
        CASE
            WHEN EXTRACT(DOW FROM start_time) IN (0, 6) THEN TRUE
            ELSE FALSE
        END AS is_weekend,
        CASE 
            WHEN EXTRACT(MONTH FROM start_time) = 1 THEN 'January'
            WHEN EXTRACT(MONTH FROM start_time) = 2 THEN 'February'
            WHEN EXTRACT(MONTH FROM start_time) = 3 THEN 'March'
            WHEN EXTRACT(MONTH FROM start_time) = 4 THEN 'April'
            WHEN EXTRACT(MONTH FROM start_time) = 5 THEN 'May'
            WHEN EXTRACT(MONTH FROM start_time) = 6 THEN 'June'
            WHEN EXTRACT(MONTH FROM start_time) = 7 THEN 'July'
            WHEN EXTRACT(MONTH FROM start_time) = 8 THEN 'August'
            WHEN EXTRACT(MONTH FROM start_time) = 9 THEN 'September'
            WHEN EXTRACT(MONTH FROM start_time) = 10 THEN 'October'
            WHEN EXTRACT(MONTH FROM start_time) = 11 THEN 'November'
            WHEN EXTRACT(MONTH FROM start_time) = 12 THEN 'December'
        END AS month_name,
        CASE
            WHEN EXTRACT(DOW FROM start_time) = 0 THEN 'Sunday'
            WHEN EXTRACT(DOW FROM start_time) = 1 THEN 'Monday'
            WHEN EXTRACT(DOW FROM start_time) = 2 THEN 'Tuesday'
            WHEN EXTRACT(DOW FROM start_time) = 3 THEN 'Wednesday'
            WHEN EXTRACT(DOW FROM start_time) = 4 THEN 'Thursday'
            WHEN EXTRACT(DOW FROM start_time) = 5 THEN 'Friday'
            WHEN EXTRACT(DOW FROM start_time) = 6 THEN 'Saturday'
        END AS day_name,
        CASE
            WHEN EXTRACT(HOUR FROM start_time) BETWEEN 6 AND 11 THEN 'Morning'
            WHEN EXTRACT(HOUR FROM start_time) BETWEEN 12 AND 17 THEN 'Afternoon'
            WHEN EXTRACT(HOUR FROM start_time) BETWEEN 18 AND 23 THEN 'Evening'
            ELSE 'Night'
        END AS time_of_day
    FROM "bike_share"."main"."stg_rides"
)

SELECT
    date,
    year,
    month,
    day,
    day_of_week,
    hour,
    quarter,
    is_weekend,
    month_name,
    day_name,
    time_of_day
FROM time_data
    );
  