-- Test that user_type values are valid

SELECT
    *
FROM "bike_share"."main"."dim_users"
WHERE user_type NOT IN ('Subscriber', 'Customer')