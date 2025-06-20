select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      -- Test that trip_duration_in_min is always positive

SELECT
    *
FROM "bike_share"."main"."stg_rides"
WHERE trip_duration_in_min <= 0
      
    ) dbt_internal_test