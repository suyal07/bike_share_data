select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      -- Test that station_id is not null

SELECT
    *
FROM "bike_share"."main"."dim_stations"
WHERE station_id IS NULL
      
    ) dbt_internal_test