select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      -- Test that day_of_week values are valid

SELECT
    *
FROM "bike_share"."main"."dim_time"
WHERE day_of_week < 0 OR day_of_week > 6
      
    ) dbt_internal_test