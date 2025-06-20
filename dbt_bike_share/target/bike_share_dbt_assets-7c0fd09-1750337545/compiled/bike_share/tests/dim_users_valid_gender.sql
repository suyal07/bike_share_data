-- Test that gender values are valid

SELECT
    *
FROM "bike_share"."main"."dim_users"
WHERE gender NOT IN ('Male', 'Female', 'Unknown', 'Other')