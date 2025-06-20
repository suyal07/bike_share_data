
  
    

    create  table
      "bike_share"."main"."dim_users__dbt_tmp"
    as (
      

WITH user_data AS (
    SELECT DISTINCT
        user_type,
        birth_year,
        gender,
        age
    FROM "bike_share"."main"."int_rides_enriched"
    WHERE user_type IS NOT NULL
),

user_age_segments AS (
    SELECT
        user_type,
        birth_year,
        gender,
        age,
        CASE
            WHEN age < 18 THEN 'Under 18'
            WHEN age BETWEEN 18 AND 24 THEN '18-24'
            WHEN age BETWEEN 25 AND 34 THEN '25-34'
            WHEN age BETWEEN 35 AND 44 THEN '35-44'
            WHEN age BETWEEN 45 AND 54 THEN '45-54'
            WHEN age BETWEEN 55 AND 64 THEN '55-64'
            WHEN age >= 65 THEN '65+'
            ELSE 'Unknown'
        END AS age_group
    FROM user_data
)

SELECT
    ROW_NUMBER() OVER(ORDER BY user_type, birth_year, gender) AS user_key,
    user_type,
    birth_year,
    gender,
    age,
    age_group
FROM user_age_segments
    );
  