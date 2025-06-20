-- Test that age groups are valid
{{ config(severity='error') }}
SELECT
    *
FROM {{ ref('dim_users') }}
WHERE age_group NOT IN ('Under 18', '18-24', '25-34', '35-44', '45-54', '55-64', '65+', 'Unknown')

