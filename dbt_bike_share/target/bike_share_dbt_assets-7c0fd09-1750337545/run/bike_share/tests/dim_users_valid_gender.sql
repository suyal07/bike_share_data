select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      -- Test that gender values are valid

SELECT
    *
FROM "bike_share"."main"."dim_users"
WHERE gender NOT IN ('Male', 'Female', 'Unknown', 'Other')
      
    ) dbt_internal_test