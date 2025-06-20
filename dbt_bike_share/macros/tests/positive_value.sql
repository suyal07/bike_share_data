{% test positive_value(model, column_name) %}

WITH validation AS (
    SELECT
        {{ column_name }} AS value
    FROM {{ model }}
)

SELECT
    *
FROM validation
WHERE value <= 0 OR value IS NULL

{% endtest %}

