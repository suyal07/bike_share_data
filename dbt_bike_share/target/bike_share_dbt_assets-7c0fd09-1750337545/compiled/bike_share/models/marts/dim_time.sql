

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
    time_of_day,
    ROW_NUMBER() OVER(ORDER BY date, hour) AS time_key
FROM "bike_share"."main"."int_time"