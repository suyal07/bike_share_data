-- Test that user_type values are valid
{{ config(severity='error') }}
SELECT
    *
FROM {{ ref('dim_users') }}
WHERE user_type NOT IN ('Subscriber', 'Customer')

