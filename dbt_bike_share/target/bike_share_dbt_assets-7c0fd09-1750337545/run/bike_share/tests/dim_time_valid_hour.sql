select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      -- Test that hour values are valid

SELECT
    *
FROM "bike_share"."main"."dim_time"
WHERE hour < 0 OR hour > 23
      
    ) dbt_internal_test