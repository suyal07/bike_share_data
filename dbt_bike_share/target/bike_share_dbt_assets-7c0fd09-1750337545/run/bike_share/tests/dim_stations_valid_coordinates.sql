select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      -- Test that station coordinates are valid

SELECT
    *
FROM "bike_share"."main"."dim_stations"
WHERE 
    latitude < -90 OR latitude > 90 OR
    longitude < -180 OR longitude > 180
      
    ) dbt_internal_test