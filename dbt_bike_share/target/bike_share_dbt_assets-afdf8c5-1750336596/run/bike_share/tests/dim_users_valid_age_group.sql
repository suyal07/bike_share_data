select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      -- Test that age groups are valid

SELECT
    *
FROM "bike_share"."main"."dim_users"
WHERE age_group NOT IN ('Under 18', '18-24', '25-34', '35-44', '45-54', '55-64', '65+', 'Unknown')
      
    ) dbt_internal_test