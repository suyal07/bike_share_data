
  create view "C:\Users\Parth Suyal\Desktop\bike_share_analysis\dbt_bike_share\bike_share.db"."main"."stg_users__dbt_tmp" as (
    

WITH source AS (
    SELECT DISTINCT
        "User Type" AS user_type,
        "Birth Year" AS birth_year,
        "Gender" AS gender
    FROM "C:\Users\Parth Suyal\Desktop\bike_share_analysis\dbt_bike_share\bike_share.db"."main"."raw_rides"
    WHERE "User Type" IS NOT NULL
)

SELECT
    user_type,
    CAST(birth_year AS INTEGER) AS birth_year,
    CASE
        WHEN gender = 0 THEN 'Unknown'
        WHEN gender = 1 THEN 'Male'
        WHEN gender = 2 THEN 'Female'
        ELSE 'Other'
    END AS gender,
    
    CASE
        WHEN birth_year IS NULL OR birth_year = 0 THEN NULL
        ELSE DATE_PART('year', CURRENT_DATE()) - birth_year
    END
 AS age
FROM source
  );
