select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      -- Test that time_key is unique

SELECT
    time_key,
    COUNT(*) AS count
FROM "bike_share"."main"."dim_time"
GROUP BY time_key
HAVING COUNT(*) > 1
      
    ) dbt_internal_test