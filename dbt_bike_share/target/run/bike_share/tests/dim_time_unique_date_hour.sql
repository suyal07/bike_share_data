select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      -- Test that date is unique (for combinations of date and hour)

SELECT
    date, hour,
    COUNT(*) AS count
FROM "bike_share"."main"."dim_time"
GROUP BY date, hour
HAVING COUNT(*) > 1
      
    ) dbt_internal_test