select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      -- Test that station_id is unique

SELECT
    station_id,
    COUNT(*) AS count
FROM "bike_share"."main"."dim_stations"
GROUP BY station_id
HAVING COUNT(*) > 1
      
    ) dbt_internal_test