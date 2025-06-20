select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      -- Schema test for required fields

SELECT *
FROM "bike_share"."main"."stg_rides"
WHERE 
    trip_duration IS NULL
    OR start_time IS NULL
    OR start_station_id IS NULL
    OR bike_id IS NULL
      
    ) dbt_internal_test