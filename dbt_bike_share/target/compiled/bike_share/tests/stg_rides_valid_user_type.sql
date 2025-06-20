-- Test that user_type values are valid

SELECT
    *
FROM "bike_share"."main"."stg_rides"
WHERE user_type NOT IN ('Subscriber', 'Customer')