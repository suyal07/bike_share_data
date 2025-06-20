select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      -- Test that month values are valid

SELECT
    *
FROM "bike_share"."main"."dim_time"
WHERE month < 1 OR month > 12
      
    ) dbt_internal_test