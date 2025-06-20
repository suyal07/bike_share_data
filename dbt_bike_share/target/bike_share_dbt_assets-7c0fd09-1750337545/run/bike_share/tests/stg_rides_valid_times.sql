select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      -- Test that start_time is before stop_time

SELECT
    *
FROM "bike_share"."main"."stg_rides"
WHERE start_time >= stop_time
      
    ) dbt_internal_test