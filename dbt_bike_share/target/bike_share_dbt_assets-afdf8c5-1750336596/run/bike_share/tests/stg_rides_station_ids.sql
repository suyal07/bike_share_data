select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      -- Test that all rides have station IDs

SELECT
    *
FROM "bike_share"."main"."stg_rides"
WHERE start_station_id IS NULL OR end_station_id IS NULL
      
    ) dbt_internal_test