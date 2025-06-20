select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      -- Test that user_key is unique

SELECT
    user_key,
    COUNT(*) AS count
FROM "bike_share"."main"."dim_users"
GROUP BY user_key
HAVING COUNT(*) > 1
      
    ) dbt_internal_test