-- Test that user_key is unique
{{ config(severity='error') }}
SELECT
    user_key,
    COUNT(*) AS count
FROM {{ ref('dim_users') }}
GROUP BY user_key
HAVING COUNT(*) > 1

