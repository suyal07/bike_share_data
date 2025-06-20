select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      -- Test that traffic statistics are not negative

SELECT
    *
FROM "bike_share"."main"."dim_stations"
WHERE 
    start_count < 0 OR 
    end_count < 0 OR 
    total_traffic < 0
      
    ) dbt_internal_test