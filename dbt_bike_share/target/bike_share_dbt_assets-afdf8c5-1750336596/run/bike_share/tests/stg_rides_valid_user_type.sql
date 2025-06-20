select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      -- Test that user_type values are valid

SELECT
    *
FROM "bike_share"."main"."stg_rides"
WHERE user_type NOT IN ('Subscriber', 'Customer')
      
    ) dbt_internal_test