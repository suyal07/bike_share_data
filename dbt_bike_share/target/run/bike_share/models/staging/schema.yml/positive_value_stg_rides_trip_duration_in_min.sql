select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      

WITH validation AS (
    SELECT
        trip_duration_in_min AS value
    FROM "bike_share"."main"."stg_rides"
)

SELECT
    *
FROM validation
WHERE value <= 0 OR value IS NULL


      
    ) dbt_internal_test