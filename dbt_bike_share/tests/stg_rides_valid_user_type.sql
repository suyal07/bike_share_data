-- Test that user_type values are valid
{{ config(severity='error') }}
SELECT
    *
FROM {{ ref('stg_rides') }}
WHERE user_type NOT IN ('Subscriber', 'Customer')

