-- Test that age groups are valid

SELECT
    *
FROM "bike_share"."main"."dim_users"
WHERE age_group NOT IN ('Under 18', '18-24', '25-34', '35-44', '45-54', '55-64', '65+', 'Unknown')